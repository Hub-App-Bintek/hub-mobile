import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_confirmation_controller.dart';

class ConsultationConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationConfirmationController>(
      () => ConsultationConfirmationController(
        Get.find<CreateDirectChatRoomUseCase>(),
      ),
      fenix: true,
    );
  }
}
