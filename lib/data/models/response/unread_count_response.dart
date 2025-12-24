import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_count_response.freezed.dart';
part 'unread_count_response.g.dart';

@freezed
class UnreadCountResponse with _$UnreadCountResponse {
  const factory UnreadCountResponse({@Default(0) int unreadCount}) =
      _UnreadCountResponse;

  factory UnreadCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseFromJson(json);
}
