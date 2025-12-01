import 'package:get/get.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_confirmation_controller.dart';

class ConsultationConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationConfirmationController>(
      () => ConsultationConfirmationController(),
      fenix: true,
    );
  }
}
