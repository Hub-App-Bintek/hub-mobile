import 'package:get/get.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/features/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:pkp_hub/features/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:pkp_hub/features/auth/presentation/controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    // The email is passed as an argument from the previous screen.
    final String email = Get.arguments as String;

    // Create temporary instances of the use cases for this feature.
    Get.lazyPut(() => VerifyOtpUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => ResendOtpUseCase(Get.find<AuthRepository>()));

    // Register the controller, injecting its dependencies.
    Get.lazyPut<VerifyOtpController>(
      () => VerifyOtpController(
        email: email,
        verifyOtpUseCase: Get.find<VerifyOtpUseCase>(),
        resendOtpUseCase: Get.find<ResendOtpUseCase>(),
        authSession: Get.find<AuthSession>(),
      ),
    );
  }
}
