import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item_response.freezed.dart';
part 'notification_item_response.g.dart';

@freezed
class NotificationItemResponse with _$NotificationItemResponse {
  const factory NotificationItemResponse({
    String? id,
    String? notificationId,
    String? title,
    String? message,
    String? channel,
    String? template,
    @Default(false) bool isRead,
    String? createdAt,
    String? readAt,
  }) = _NotificationItemResponse;

  factory NotificationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemResponseFromJson(json);
}
