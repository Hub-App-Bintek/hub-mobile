import 'package:get/get.dart';
import 'package:pkp_hub/features/inbox/controllers/inbox_controller.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController(), fenix: true);
  }
}
