import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_verification_response.freezed.dart';
part 'forgot_password_verification_response.g.dart';

@freezed
class ForgotPasswordVerificationResponse
    with _$ForgotPasswordVerificationResponse {
  const factory ForgotPasswordVerificationResponse({
    String? resetToken,
    int? expiresIn,
  }) = _ForgotPasswordVerificationResponse;

  factory ForgotPasswordVerificationResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$ForgotPasswordVerificationResponseFromJson(json);
}
