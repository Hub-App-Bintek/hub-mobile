import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/request/mark_notifications_read_request.dart';
import 'package:pkp_hub/data/models/response/notification_item_response.dart';
import 'package:pkp_hub/domain/usecases/notification/get_notifications_use_case.dart';
import 'package:pkp_hub/domain/usecases/notification/get_unread_count_use_case.dart';
import 'package:pkp_hub/domain/usecases/notification/mark_notifications_read_use_case.dart';

class InboxController extends BaseController {
  InboxController({
    required GetNotificationsUseCase getNotificationsUseCase,
    required GetUnreadCountUseCase getUnreadCountUseCase,
    required MarkNotificationsReadUseCase markNotificationsReadUseCase,
  }) : _getNotificationsUseCase = getNotificationsUseCase,
       _getUnreadCountUseCase = getUnreadCountUseCase,
       _markNotificationsReadUseCase = markNotificationsReadUseCase;

  final GetNotificationsUseCase _getNotificationsUseCase;
  final GetUnreadCountUseCase _getUnreadCountUseCase;
  final MarkNotificationsReadUseCase _markNotificationsReadUseCase;

  final notifications = <NotificationItemResponse>[].obs;
  final isLoading = false.obs;
  final isRefreshing = false.obs;
  final hasNext = false.obs;
  final unreadCount = 0.obs;
  final isLoadingMore = false.obs;

  int _currentPage = 0;
  static const _pageSize = 20;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications({bool refresh = false}) async {
    if (refresh) {
      isRefreshing.value = true;
      _currentPage = 0;
    } else {
      isLoading.value = true;
    }

    try {
      await handleAsync(
        () => _getNotificationsUseCase(
          GetNotificationsQuery(page: _currentPage, size: _pageSize),
        ),
        onSuccess: (resp) {
          if (refresh) {
            notifications.assignAll(resp.notifications);
          } else {
            notifications.addAll(resp.notifications);
          }
          hasNext.value = resp.hasNext;
          unreadCount.value = resp.unreadCount;
          if (resp.hasNext) {
            _currentPage += 1;
          }
        },
        onFailure: showError,
      );
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
      isLoadingMore.value = false;
    }
  }

  String formattedDate(String? iso) {
    return Formatters.formatIsoDateTime(
          iso,
          datePattern: 'dd MMM yyyy',
          timePattern: 'HH.mm',
        ) ??
        '';
  }

  Future<void> markAsRead(String notificationId) async {
    final idx = notifications.indexWhere((n) => n.id == notificationId);
    if (idx == -1) return;
    // Optimistic update
    final updated = notifications[idx].copyWith(isRead: true);
    notifications[idx] = updated;
    unreadCount.value = (unreadCount.value - 1).clamp(0, unreadCount.value + 1);

    await handleAsync(
      () => _markNotificationsReadUseCase(
        MarkNotificationsReadRequest(notificationIds: [notificationId]),
      ),
      onSuccess: (_) {},
      onFailure: (Failure failure) {
        showError(failure);
        // revert on failure
        notifications[idx] = notifications[idx].copyWith(
          isRead: !updated.isRead,
        );
        unreadCount.value += 1;
      },
    );
  }

  Future<void> markAllAsRead() async {
    final ids = notifications.map((e) => e.id).whereType<String>().toList();
    notifications.assignAll(
      notifications.map((n) => n.copyWith(isRead: true)).toList(),
    );
    unreadCount.value = 0;

    await handleAsync(
      () => _markNotificationsReadUseCase(
        MarkNotificationsReadRequest(notificationIds: ids),
      ),
      onSuccess: (_) {},
      onFailure: (failure) {
        showError(failure);
        // If it fails, re-fetch to sync state
        fetchNotifications(refresh: true);
      },
    );
  }

  @override
  Future<void> refresh() => fetchNotifications(refresh: true);

  Future<void> loadMore() async {
    if (isLoadingMore.value || !hasNext.value) return;
    isLoadingMore.value = true;
    await fetchNotifications();
  }
}
