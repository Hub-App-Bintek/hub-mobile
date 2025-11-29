import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';

class ConsultationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultationDetailsController>(
      () => ConsultationDetailsController(Get.find<UserStorage>()),
    );
  }
}
