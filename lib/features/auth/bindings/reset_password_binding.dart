import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/reset_password_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(Get.find<ResetPasswordUseCase>()),
      fenix: true,
    );
  }
}
