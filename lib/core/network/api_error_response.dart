import 'dart:convert';

/// A model representing the structured error response from the API.
class ApiErrorResponse {
  final String errorCode;
  final String message;

  ApiErrorResponse({required this.errorCode, required this.message});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      errorCode: json['errorCode'] as String,
      message: json['message'] as String,
    );
  }

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
