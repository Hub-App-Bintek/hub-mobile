import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/notification_api_service.dart';
import 'package:pkp_hub/data/models/request/mark_notifications_read_request.dart';
import 'package:pkp_hub/data/models/response/notification_page_response.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';
import 'package:dio/dio.dart';

abstract class NotificationNetworkDataSource {
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

class NotificationNetworkDataSourceImpl
    implements NotificationNetworkDataSource {
  NotificationNetworkDataSourceImpl(this._apiClient, this._service);

  final ApiClient _apiClient;
  final NotificationApiService _service;

  @override
  Future<Result<NotificationPageResponse, Failure>> getNotifications({
    int page = 0,
    int size = 20,
    bool unreadOnly = false,
  }) async {
    try {
      final response = await _service.getNotifications(
        page: page,
        size: size,
        unreadOnly: unreadOnly,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> getUnreadCount() async {
    try {
      final response = await _service.getUnreadCount();
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> markAsRead(
    MarkNotificationsReadRequest request,
  ) async {
    try {
      final response = await _service.markAsRead(request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }
}
