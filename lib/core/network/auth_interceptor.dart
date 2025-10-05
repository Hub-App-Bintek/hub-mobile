import 'package:dio/dio.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';

/// An interceptor that dynamically injects the authorization token into every request.
class AuthInterceptor extends Interceptor {
  final AuthSession _authSession;

  AuthInterceptor(this._authSession);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get the token from the session's fast in-memory cache.
    final token = _authSession.token;

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Continue the request chain.
    super.onRequest(options, handler);
  }
}
