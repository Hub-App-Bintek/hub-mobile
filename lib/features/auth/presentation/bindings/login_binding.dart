import 'package:get/get.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/features/auth/domain/usecases/login_use_case.dart';
import 'package:pkp_hub/features/auth/presentation/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(
      () => LoginUseCase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: Get.find<LoginUseCase>(),
        authSession: Get.find<AuthSession>(),
      ),
    );
  }
}
