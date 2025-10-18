import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_activation_request.freezed.dart';
part 'resend_activation_request.g.dart';

@freezed
class ResendActivationRequest with _$ResendActivationRequest {
  const factory ResendActivationRequest({
    required String email,
  }) = _ResendActivationRequest;

  factory ResendActivationRequest.fromJson(Map<String, dynamic> json) => _$ResendActivationRequestFromJson(json);
}

