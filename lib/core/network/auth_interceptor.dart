import 'package:dio/dio.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage _authStorage;

  AuthInterceptor(this._authStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _authStorage.getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
