import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(Get.find<AuthStorage>()));
    Get.lazyPut(() => HomeController(Get.find<AuthStorage>()));
  }
}
