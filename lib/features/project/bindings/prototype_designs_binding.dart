import 'package:get/get.dart';
import 'package:pkp_hub/features/project/controllers/prototype_designs_controller.dart';

class PrototypeDesignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrototypeDesignsController());
  }
}
