import 'package:dio/dio.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_error_response.dart';
import 'package:pkp_hub/core/network/auth_interceptor.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/utils/logger.dart';

class ApiClient {
  late final Dio _dio;
  final _logger = Logger();

  ApiClient({required AuthSession authSession}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.instance.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Accept': 'application/json'},
      ),
    );
    _setupInterceptors(authSession);
  }

  void _setupInterceptors(AuthSession authSession) {
    // Create the AuthInterceptor and pass the session to it.
    _dio.interceptors.add(AuthInterceptor(authSession));

    // Add the logging interceptor.
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.d(
            'REQUEST[${options.method}] => URL: ${options.baseUrl}${options.path}',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d(
            'RESPONSE[${response.statusCode}] => URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}',
          );
          _logger.d('RESPONSE[${response.statusCode}] => ${response.data}');
          return handler.next(response);
        },
        onError: (e, handler) {
          _logger.e(
            'ERROR[${e.response?.statusCode}] => URL: ${e.requestOptions.baseUrl}${e.requestOptions.path}',
            error: e.error,
          );
          _logger.e(
            'ERROR[${e.response?.statusCode}] => ${e.response?.data ?? ''}',
            error: e.error,
          );
          return handler.next(e);
        },
      ),
    );
  }

  /// Executes a GET request and returns a [Result] object.
  Future<Result<T, Failure>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(response.data as T);
    } on DioException catch (e) {
      return Error(_handleDioError(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }

  /// Executes a POST request and returns a [Result] object.
  Future<Result<T, Failure>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return Success(response.data as T);
    } on DioException catch (e) {
      return Error(_handleDioError(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }

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
}
