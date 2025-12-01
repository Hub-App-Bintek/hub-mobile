import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    required String confirmPassword,
    required String title,
    required String fullName,
    required String phone,
    required String idType,
    required String idNumber,
    required int provinceId,
    required int cityId,
    required int districtId,
    required int subdistrictId,
    required String address,
    required String idPhotoPath,
    required String selfiePhotoPath,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
