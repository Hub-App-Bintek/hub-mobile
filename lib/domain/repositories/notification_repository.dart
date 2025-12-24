import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/notification/notification_network_data_source.dart';
import 'package:pkp_hub/data/models/request/mark_notifications_read_request.dart';
import 'package:pkp_hub/data/models/response/notification_page_response.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';

abstract class NotificationRepository {
  Future<Result<NotificationPageResponse, Failure>> getNotifications({
    int page,
    int size,
    bool unreadOnly,
  });

  Future<Result<UnreadCountResponse, Failure>> getUnreadCount();

  Future<Result<UnreadCountResponse, Failure>> markAsRead(
    MarkNotificationsReadRequest request,
  );
}

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._networkDataSource);

  final NotificationNetworkDataSource _networkDataSource;

  @override
  Future<Result<NotificationPageResponse, Failure>> getNotifications({
    int page = 0,
    int size = 20,
    bool unreadOnly = false,
  }) {
    return _networkDataSource.getNotifications(
      page: page,
      size: size,
      unreadOnly: unreadOnly,
    );
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> getUnreadCount() {
    return _networkDataSource.getUnreadCount();
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> markAsRead(
    MarkNotificationsReadRequest request,
  ) {
    return _networkDataSource.markAsRead(request);
  }
}
