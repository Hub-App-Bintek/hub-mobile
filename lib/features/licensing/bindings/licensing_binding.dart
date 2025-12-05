import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_controller.dart';

class LicensingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetConsultationsUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => LicensingController(Get.find<GetConsultationsUseCase>()),
      fenix: true,
    );
  }
}
