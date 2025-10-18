import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_action_response.freezed.dart';
part 'user_action_response.g.dart';

@freezed
class UserActionResponse with _$UserActionResponse {
  const factory UserActionResponse({
    required int id,
    required String email,
    String? name,
  }) = _UserActionResponse;

  factory UserActionResponse.fromJson(Map<String, dynamic> json) => _$UserActionResponseFromJson(json);
}

