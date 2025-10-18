import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_activation_response.freezed.dart';
part 'resend_activation_response.g.dart';

@freezed
class ResendActivationResponse with _$ResendActivationResponse {
  const factory ResendActivationResponse({
    required String message,
  }) = _ResendActivationResponse;

  factory ResendActivationResponse.fromJson(Map<String, dynamic> json) => _$ResendActivationResponseFromJson(json);
}

