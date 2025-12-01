import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/register_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUseCase>(
      () => RegisterUseCase(Get.find<AuthRepository>()),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find<RegisterUseCase>()),
      fenix: true,
    );
  }
}
