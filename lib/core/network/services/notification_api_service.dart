import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/mark_notifications_read_request.dart';
import 'package:pkp_hub/data/models/response/notification_page_response.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_api_service.g.dart';

@RestApi()
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String? baseUrl}) =
      _NotificationApiService;

  @GET(ApiEndpoints.notifications)
  Future<NotificationPageResponse> getNotifications({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
    @Query('unreadOnly') bool unreadOnly = false,
  });

  @GET(ApiEndpoints.notificationsUnreadCount)
  Future<UnreadCountResponse> getUnreadCount();

  @PATCH(ApiEndpoints.notificationsMarkRead)
  Future<UnreadCountResponse> markAsRead(
    @Body() MarkNotificationsReadRequest body,
  );
}
