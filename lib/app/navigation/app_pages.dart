import 'package:get/get.dart';
import 'package:pkp_hub/features/auth/bindings/login_binding.dart';
import 'package:pkp_hub/features/auth/bindings/register_binding.dart';
import 'package:pkp_hub/features/auth/bindings/verify_otp_binding.dart';
import 'package:pkp_hub/features/auth/screens/login_screen.dart';
import 'package:pkp_hub/features/auth/screens/register_screen.dart';
import 'package:pkp_hub/features/auth/screens/verify_otp_screen.dart';
import 'package:pkp_hub/features/kyc/bindings/kyc_binding.dart';
import 'package:pkp_hub/features/kyc/screens/kyc_screen.dart';
import 'package:pkp_hub/features/main/bindings/main_binding.dart';
import 'package:pkp_hub/features/main/screens/main_screen.dart';
import 'package:pkp_hub/features/project/bindings/create_project_binding.dart';
import 'package:pkp_hub/features/project/screens/create_project_screen.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static const initial = AppRoutes.main;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.verifyOtp,
      page: () => const VerifyOtpScreen(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.kyc,
      page: () => const KycScreen(),
      binding: KycBinding(),
    ),
    GetPage(
      name: _Paths.createProject,
      page: () => const CreateProjectScreen(),
      binding: CreateProjectBinding(),
    ),
  ];
}
