import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    bool? status,
    String? message,
    RegisterResponseData? data,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class RegisterResponseData with _$RegisterResponseData {
  const factory RegisterResponseData({
    String? userId,
    String? verificationStatus,
  }) = _RegisterResponseData;

  factory RegisterResponseData.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDataFromJson(json);
}
