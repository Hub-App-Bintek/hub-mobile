import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/forgot_password_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/resend_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/verify_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/verify_forgot_password_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/register_device_token_use_case.dart';
import 'package:pkp_hub/core/services/notification_service.dart';
import 'package:pkp_hub/features/auth/controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerifyOtpUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => ResendOtpUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => VerifyForgotPasswordOtpUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => ForgotPasswordUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => RegisterDeviceTokenUseCase(Get.find<AuthRepository>()),
      fenix: true,
    );

    Get.lazyPut<VerifyOtpController>(
      () => VerifyOtpController(
        verifyOtpUseCase: Get.find<VerifyOtpUseCase>(),
        verifyForgotPasswordOtpUseCase:
            Get.find<VerifyForgotPasswordOtpUseCase>(),
        resendOtpUseCase: Get.find<ResendOtpUseCase>(),
        forgotPasswordUseCase: Get.find<ForgotPasswordUseCase>(),
        registerDeviceTokenUseCase: Get.find<RegisterDeviceTokenUseCase>(),
        notificationService: Get.find<NotificationService>(),
      ),
      fenix: true,
    );
  }
}
