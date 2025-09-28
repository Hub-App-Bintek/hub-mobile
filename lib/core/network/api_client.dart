import 'package:dio/dio.dart'; // Or 'package:http/http.dart' if you prefer http
// import 'package:pkp_hub/core/config/app_config.dart'; // For base URL

// This file will configure the HTTP client (e.g., Dio or http).
// Includes base URL, interceptors for logging, auth, error handling, etc.

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    final options = BaseOptions(
      // baseUrl: AppConfig.baseUrl, // Load from a config file, not hardcoded
      connectTimeout: const Duration(milliseconds: 15000), // 15 seconds
      receiveTimeout: const Duration(milliseconds: 15000), // 15 seconds
      // headers: { 'Content-Type': 'application/json' },
    );
    _dio = Dio(options);

    // Add interceptors for logging, authentication, error handling, etc.
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // _dio.interceptors.add(_AuthInterceptor());
    // _dio.interceptors.add(_ErrorInterceptor());
  }

  Dio get dio => _dio;

  // Example of an auth interceptor (conceptual)
  // Interceptor _AuthInterceptor() {
  //   return InterceptorsWrapper(
  //     onRequest: (options, handler) async {
  //       // Retrieve token from secure storage
  //       // const token = await SecureStorageService.getToken();
  //       // if (token != null) {
  //       //   options.headers['Authorization'] = 'Bearer $token';
  //       // }
  //       return handler.next(options);
  //     },
  //   );
  // }

  // Example of an error interceptor (conceptual)
  // Interceptor _ErrorInterceptor() {
  //   return InterceptorsWrapper(
  //     onError: (DioException e, handler) {
  //       // Handle specific Dio errors or wrap them in custom exceptions
  //       // e.g., if (e.type == DioExceptionType.connectionTimeout) { ... }
  //       return handler.next(e);
  //     },
  //   );
  // }
}

// You would typically register this ApiClient as a singleton in your service_locator.dart
// getIt.registerLazySingleton<ApiClient>(() => ApiClient());
