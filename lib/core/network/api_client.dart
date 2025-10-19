import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_error_response.dart';
import 'package:pkp_hub/core/network/auth_interceptor.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/core/utils/logger.dart';

class ApiClient {
  late final Dio _dio;

  // Expose the configured Dio for consumers like Retrofit services.
  Dio get dio => _dio;

  ApiClient({required AuthStorage authStorage, required Logger logger}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.instance.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    _setupInterceptors(authStorage, logger);
  }

  void _setupInterceptors(AuthStorage authSession, Logger logger) {
    // Create the AuthInterceptor and pass the session to it.
    _dio.interceptors.add(AuthInterceptor(authSession));

    // Concise request/response logging with redacted sensitive headers
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final fullUrl = _buildFullUrl(
            options.baseUrl,
            options.path,
            options.queryParameters,
          );

          logger.d('URL [${options.method}]: $fullUrl');
          if (options.headers.isNotEmpty) {
            logger.d('HEADERS: ${_safeJson(_redactHeaders(options.headers))}');
          }
          if (options.data != null) {
            logger.d('REQUEST BODY: ${_stringifyBody(options.data)}');
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          final ro = response.requestOptions;
          final fullUrl = _buildFullUrl(
            ro.baseUrl,
            ro.path,
            ro.queryParameters,
          );

          logger.d('URL [${ro.method}] [${response.statusCode}]: $fullUrl');
          final resHeaders = <String, dynamic>{
            for (final e in response.headers.map.entries)
              e.key: e.value.join(', '),
          };
          if (resHeaders.isNotEmpty) {
            logger.d('HEADERS: ${_safeJson(_redactHeaders(resHeaders))}');
          }
          if (response.data != null) {
            logger.d('RESPONSE BODY: ${_stringifyBody(response.data)}');
          }

          return handler.next(response);
        },
        onError: (e, handler) {
          final ro = e.requestOptions;
          final reqUrl = _buildFullUrl(ro.baseUrl, ro.path, ro.queryParameters);
          logger.d(
            'URL [${ro.method}] [${e.response?.statusCode ?? '-'}]: $reqUrl',
          );

          if (ro.headers.isNotEmpty) {
            logger.d('HEADERS: ${_safeJson(_redactHeaders(ro.headers))}');
          }
          if (ro.data != null) {
            logger.d('REQUEST BODY: ${_stringifyBody(ro.data)}');
          }

          final resHeaders = <String, dynamic>{
            for (final entry in (e.response?.headers.map ?? {}).entries)
              entry.key: entry.value.join(', '),
          };
          if (resHeaders.isNotEmpty) {
            logger.d('HEADERS: ${_safeJson(_redactHeaders(resHeaders))}');
          }
          if (e.response?.data != null) {
            logger.d('RESPONSE BODY: ${_stringifyBody(e.response?.data)}');
          }

          return handler.next(e);
        },
      ),
    );
  }

  /// Public helper to convert a DioException to our Failure type.
  Failure toFailure(DioException e) => _handleDioError(e);

  /// Transforms a [DioException] into a structured [Failure] object.
  Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        final apiError = ApiErrorResponse.tryParse(e.response?.data);
        if (apiError != null) {
          return ApiFailure(apiError);
        }
        return ServerFailure(
          statusCode: e.response?.statusCode,
          message: 'Received an invalid response from the server.',
        );

      case DioExceptionType.cancel:
        return const NetworkFailure('Request was cancelled.');

      default:
        return const NetworkFailure('An unexpected network error occurred.');
    }
  }

  // === Logging helpers ===

  String _buildFullUrl(String baseUrl, String path, Map<String, dynamic> qp) {
    final buffer = StringBuffer()
      ..write(baseUrl)
      ..write(path);
    if (qp.isEmpty) return buffer.toString();

    final pairs = <String>[];
    qp.forEach((key, value) {
      if (value == null) return;
      if (value is Iterable) {
        for (final v in value) {
          pairs.add(
            '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(_qpVal(v))}',
          );
        }
      } else {
        pairs.add(
          '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(_qpVal(value))}',
        );
      }
    });

    buffer
      ..write('?')
      ..write(pairs.join('&'));
    return buffer.toString();
  }

  String _qpVal(Object? v) {
    if (v == null) return '';
    if (v is String) return v;
    if (v is num || v is bool) return v.toString();
    if (v is DateTime) return v.toIso8601String();
    try {
      return jsonEncode(v);
    } catch (_) {
      return v.toString();
    }
  }

  Map<String, dynamic> _redactHeaders(Map<String, dynamic> headers) {
    final copy = Map<String, dynamic>.from(headers);
    final isDev = Environment.instance.isDevelopment;

    void redactAlways(String key) {
      if (copy.containsKey(key)) copy[key] = '***';
    }

    void redactUnlessDev(String key) {
      if (!isDev && copy.containsKey(key)) copy[key] = '***';
    }

    // Authorization: visible in development, redacted otherwise
    redactUnlessDev('Authorization');
    redactUnlessDev('authorization');

    // Cookies: always redacted
    redactAlways('Cookie');
    redactAlways('cookie');
    redactAlways('Set-Cookie');
    return copy;
  }

  String _stringifyBody(Object? data) {
    if (data == null) return 'null';

    // Handle FormData separately to avoid printing raw bytes
    if (data is FormData) {
      final fields = {for (final f in data.fields) f.key: f.value};
      final files = data.files.map((f) => f.value.filename).toList();
      return _truncate(_prettyJson({'fields': fields, 'files': files}));
    }

    // If already a Map/List, pretty-print
    if (data is Map<String, dynamic> || data is List<dynamic>) {
      return _truncate(_prettyJson(data));
    }

    // If it's a string, try to pretty it as JSON
    if (data is String) {
      return _truncate(_prettyJsonIfPossible(data));
    }

    // Try calling toJson() dynamically (for freezed/json_serializable models)
    try {
      final dynamic dyn = data;
      final maybeJson = dyn.toJson();
      if (maybeJson is Map || maybeJson is List) {
        return _truncate(_prettyJson(maybeJson));
      }
    } catch (_) {
      // ignore and fallback
    }

    // Fallback to toString
    return _truncate(data.toString());
  }

  String _prettyJson(Object? obj) {
    try {
      return const JsonEncoder.withIndent('  ').convert(obj);
    } catch (_) {
      return obj.toString();
    }
  }

  String _prettyJsonIfPossible(String s) {
    try {
      final decoded = json.decode(s);
      return const JsonEncoder.withIndent('  ').convert(decoded);
    } catch (_) {
      return s;
    }
  }

  String _safeJson(Object? obj) {
    try {
      return _truncate(const JsonEncoder.withIndent('  ').convert(obj));
    } catch (_) {
      return _truncate(obj.toString());
    }
  }

  String _truncate(String s, {int max = 12000}) {
    if (s.length <= max) return s;
    return '${s.substring(0, max)}... [truncated ${s.length - max} chars]';
  }
}
