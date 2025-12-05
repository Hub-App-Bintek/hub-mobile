import 'package:get/get.dart';
import 'package:pkp_hub/features/monitoring/controllers/report_detail_controller.dart';

class MonitoringDetailReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportDetailController(), fenix: true);
  }
}
