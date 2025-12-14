import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/accept_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/reject_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_v2_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_confirmation_controller.dart';

class ConsultationConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcceptConsultationUseCase>(
      () => AcceptConsultationUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<RejectConsultationUseCase>(
      () => RejectConsultationUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetProjectV2UseCase>(
      () => GetProjectV2UseCase(Get.find<ProjectRepository>()),
      fenix: true,
    );
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => Get.find<CreateDirectChatRoomUseCase>(),
    );

    Get.lazyPut<ConsultationConfirmationController>(
      () => ConsultationConfirmationController(
        Get.find<CreateDirectChatRoomUseCase>(),
        Get.find<AcceptConsultationUseCase>(),
        Get.find<RejectConsultationUseCase>(),
        Get.find<GetProjectV2UseCase>(),
      ),
      fenix: true,
    );
  }
}
