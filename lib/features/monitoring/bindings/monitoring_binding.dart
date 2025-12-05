import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_controller.dart';

class MonitoringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetConsultationsUseCase(Get.find<ConsultationRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => MonitoringController(Get.find<GetConsultationsUseCase>()),
      fenix: true,
    );
  }
}
