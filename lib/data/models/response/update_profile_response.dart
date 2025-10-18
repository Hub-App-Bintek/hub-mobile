import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_response.freezed.dart';
part 'update_profile_response.g.dart';

@freezed
class UpdateProfileResponse with _$UpdateProfileResponse {
  const factory UpdateProfileResponse({
    required String message,
  }) = _UpdateProfileResponse;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseFromJson(json);
}

