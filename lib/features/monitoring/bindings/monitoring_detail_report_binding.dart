import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_report_detail_usecase.dart';
import 'package:pkp_hub/features/monitoring/controllers/report_detail_controller.dart';

class MonitoringDetailReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetReportDetailUseCase(Get.find<MonitoringRepository>()),
    );
    Get.lazyPut(
      () => ReportDetailController(Get.find<GetReportDetailUseCase>()),
      fenix: true,
    );
  }
}
