import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_token_request.freezed.dart';
part 'register_device_token_request.g.dart';

@freezed
class RegisterDeviceTokenRequest with _$RegisterDeviceTokenRequest {
  const factory RegisterDeviceTokenRequest({
    required String deviceToken,
    required String deviceType,
    required String deviceModel,
    required String appVersion,
  }) = _RegisterDeviceTokenRequest;

  factory RegisterDeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceTokenRequestFromJson(json);
}
