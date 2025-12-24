import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_forgot_password_otp_request.freezed.dart';
part 'verify_forgot_password_otp_request.g.dart';

@freezed
class VerifyForgotPasswordOtpRequest with _$VerifyForgotPasswordOtpRequest {
  const factory VerifyForgotPasswordOtpRequest({
    required String email,
    required String otpCode,
  }) = _VerifyForgotPasswordOtpRequest;

  factory VerifyForgotPasswordOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyForgotPasswordOtpRequestFromJson(json);
}
