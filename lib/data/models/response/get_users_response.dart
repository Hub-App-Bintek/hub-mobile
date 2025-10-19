import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_users_response.freezed.dart';
part 'get_users_response.g.dart';

@freezed
class GetUsersResponse with _$GetUsersResponse {
  const factory GetUsersResponse({required List<UserData> users}) =
      _GetUsersResponse;

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String email,
    String? name,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
