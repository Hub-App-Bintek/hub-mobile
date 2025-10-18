import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_account_request.freezed.dart';
part 'activate_account_request.g.dart';

@freezed
class ActivateAccountRequest with _$ActivateAccountRequest {
  const factory ActivateAccountRequest({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) = _ActivateAccountRequest;

  factory ActivateAccountRequest.fromJson(Map<String, dynamic> json) => _$ActivateAccountRequestFromJson(json);
}

