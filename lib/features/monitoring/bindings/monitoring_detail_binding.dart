import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_findings_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_reports_usecase.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_detail_controller.dart';

class MonitoringDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Inject use cases for fetching details, approving contracts, etc.
    Get.lazyPut(() => GetReportsUseCase(Get.find()));
    Get.lazyPut(() => GetFindingsUseCase(Get.find()));
    Get.lazyPut(() => MonitoringDetailController(Get.find(), Get.find()), fenix: true);
  }
}
