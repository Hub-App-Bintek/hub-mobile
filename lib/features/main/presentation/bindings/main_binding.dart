import 'package:get/get.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/features/main/presentation/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/presentation/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(Get.find<AuthSession>()));
    Get.lazyPut(() => HomeController(Get.find<AuthSession>()));
  }
}
