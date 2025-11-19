import 'package:get/get.dart';
import 'package:pkp_hub/features/project/controllers/design_type_controller.dart';

class DesignTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DesignTypeController());
  }
}
