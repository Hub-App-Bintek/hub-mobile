import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_requests_usecase.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class ProjectsBinding extends Bindings {
  ProjectsBinding();

  @override
  void dependencies() {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetMonitoringRequestsUseCase>(
      () => GetMonitoringRequestsUseCase(Get.find<MonitoringRepository>()),
      fenix: true,
    );
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(
        Get.find<UserStorage>(),
        Get.find<GetConsultationsUseCase>(),
        Get.find<CreateDirectChatRoomUseCase>(),
        Get.find<GetMonitoringRequestsUseCase>(),
      ),
      fenix: true,
    );
  }
}
