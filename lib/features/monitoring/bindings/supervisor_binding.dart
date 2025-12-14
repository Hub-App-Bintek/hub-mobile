import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';
import 'package:pkp_hub/domain/usecases/monitoring/create_monitoring_request_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_supervisor_usecase.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';

class SupervisorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetProfessionalsUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(
      () => CreateMonitoringRequestUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(
      () => SupervisorController(
        Get.find<CreateMonitoringRequestUseCase>(),
        Get.find<GetProfessionalsUseCase>(),
      ),
      fenix: true,
    );
  }
}
