import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';

class AuthInterceptor extends Interceptor {
  final UserStorage _userStorage;

  AuthInterceptor(this._userStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _userStorage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.forbidden) {
      await _userStorage.clear();
      Get.offAllNamed(AppRoutes.main);
    }
    super.onError(err, handler);
  }
}
