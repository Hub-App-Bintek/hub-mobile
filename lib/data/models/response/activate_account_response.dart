import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_account_response.freezed.dart';
part 'activate_account_response.g.dart';

@freezed
class ActivateAccountResponse with _$ActivateAccountResponse {
  const factory ActivateAccountResponse({required String message}) =
      _ActivateAccountResponse;

  factory ActivateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivateAccountResponseFromJson(json);
}
