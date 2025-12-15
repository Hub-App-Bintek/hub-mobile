import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.freezed.dart';
part 'api_error_response.g.dart';

@freezed
class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    required String? errorCode,
    required String? message,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  /// A helper to safely parse a response body.
  static ApiErrorResponse? tryParse(dynamic data) {
    if (data == null) return null;
    try {
      if (data is String) data = jsonDecode(data);
      if (data is Map<String, dynamic>) return ApiErrorResponse.fromJson(data);
    } catch (_) {
      // Ignore parsing errors
    }
    return null;
  }
}
