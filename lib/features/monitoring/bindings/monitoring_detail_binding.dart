import 'package:get/get.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_detail_controller.dart';

class MonitoringDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: Inject use cases for fetching details, approving contracts, etc.
    Get.lazyPut(() => MonitoringDetailController());
  }
}
