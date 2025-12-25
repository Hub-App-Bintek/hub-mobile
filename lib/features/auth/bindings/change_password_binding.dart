import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/change_password_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );

    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(Get.find<ChangePasswordUseCase>()),
      fenix: true,
    );
  }
}
