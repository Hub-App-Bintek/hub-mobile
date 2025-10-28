import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/login_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<AuthRepository>()));
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<LoginUseCase>()),
    );
  }
}
