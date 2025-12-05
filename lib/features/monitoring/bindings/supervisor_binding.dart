import 'package:get/get.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';

class SupervisorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorController(), fenix: true);
  }
}
