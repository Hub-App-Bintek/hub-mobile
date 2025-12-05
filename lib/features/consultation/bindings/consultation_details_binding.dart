import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';

class ConsultationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
    );
    Get.lazyPut(() => GetProjectDetailsUseCase(Get.find<ProjectRepository>()),);
    Get.lazyPut<ConsultationDetailsController>(
      () => ConsultationDetailsController(
        Get.find<UserStorage>(),
        Get.find<CreateDirectChatRoomUseCase>(),
        Get.find<GetProjectDetailsUseCase>(),
      ),
      fenix: true,
    );
  }
}
