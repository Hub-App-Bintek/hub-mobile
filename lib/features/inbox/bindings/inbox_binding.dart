import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/notification_repository.dart';
import 'package:pkp_hub/domain/usecases/notification/get_notifications_use_case.dart';
import 'package:pkp_hub/domain/usecases/notification/get_unread_count_use_case.dart';
import 'package:pkp_hub/domain/usecases/notification/mark_notifications_read_use_case.dart';
import 'package:pkp_hub/features/inbox/controllers/inbox_controller.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(Get.find<NotificationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetUnreadCountUseCase>(
      () => GetUnreadCountUseCase(Get.find<NotificationRepository>()),
      fenix: true,
    );
    Get.lazyPut<MarkNotificationsReadUseCase>(
      () => MarkNotificationsReadUseCase(Get.find<NotificationRepository>()),
      fenix: true,
    );

    Get.lazyPut<InboxController>(
      () => InboxController(
        getNotificationsUseCase: Get.find<GetNotificationsUseCase>(),
        getUnreadCountUseCase: Get.find<GetUnreadCountUseCase>(),
        markNotificationsReadUseCase: Get.find<MarkNotificationsReadUseCase>(),
      ),
      fenix: true,
    );
  }
}
