import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class SafeChuckerInterceptor extends Interceptor {
  SafeChuckerInterceptor({ChuckerDioInterceptor? inner})
    : _inner = inner ?? ChuckerDioInterceptor();

  final ChuckerDioInterceptor _inner;

  bool _shouldSkip(RequestOptions options) =>
      options.extra['skipChucker'] == true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_shouldSkip(options)) {
      handler.next(options);
      return;
    }
    _inner.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_shouldSkip(response.requestOptions)) {
      handler.next(response);
      return;
    }
    _inner.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldSkip(err.requestOptions)) {
      handler.next(err);
      return;
    }
    _inner.onError(err, handler);
  }
}
