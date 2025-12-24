import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/response/notification_item_response.dart';

part 'notification_page_response.freezed.dart';
part 'notification_page_response.g.dart';

@freezed
class NotificationPageResponse with _$NotificationPageResponse {
  const factory NotificationPageResponse({
    @Default(<NotificationItemResponse>[])
    List<NotificationItemResponse> notifications,
    @Default(0) int currentPage,
    @Default(0) int totalPages,
    @Default(0) int totalElements,
    @Default(0) int pageSize,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrevious,
    @Default(0) int unreadCount,
  }) = _NotificationPageResponse;

  factory NotificationPageResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationPageResponseFromJson(json);
}
