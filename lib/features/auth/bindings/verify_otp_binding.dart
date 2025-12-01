import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/resend_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/verify_otp_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/verify_otp_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => ResendOtpUseCase(Get.find<AuthRepository>()));

    final args = Get.arguments;
    String email;
    if (args is VerifyOtpArgs) {
      email = args.email;
    } else if (args is String) {
      email = args;
    } else {
      email = '';
    }
    Get.lazyPut<VerifyOtpController>(
      () => VerifyOtpController(
        email: email,
        verifyOtpUseCase: Get.find<VerifyOtpUseCase>(),
        resendOtpUseCase: Get.find<ResendOtpUseCase>(),
        authSession: Get.find<UserStorage>(),
      ),
      fenix: true,
    );
  }
}
