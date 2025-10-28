import 'package:dio/dio.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_error_response.dart';
import 'package:pkp_hub/core/network/auth_interceptor.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class ApiClient {
  late final Dio _dio;

  Dio get dio => _dio;

  ApiClient({required UserStorage userStorage, required Talker talker}) {
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
    _setupInterceptors(userStorage, talker);
  }

  void _setupInterceptors(UserStorage userStorage, Talker talker) {
    _dio.interceptors.add(AuthInterceptor(userStorage));
    final isLoggingEnabled = Environment.instance.enableLogging;
    if (isLoggingEnabled) {
      _dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseHeaders: true,
            printResponseData: true,
            printResponseMessage: false,
          ),
        ),
      );
    }
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
}
