import 'package:get/get.dart';
import 'package:pkp_hub/features/auth/presentation/bindings/login_binding.dart';
import 'package:pkp_hub/features/auth/presentation/bindings/verify_otp_binding.dart';
import 'package:pkp_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:pkp_hub/features/auth/presentation/screens/register_screen.dart';
import 'package:pkp_hub/features/auth/presentation/bindings/register_binding.dart';
import 'package:pkp_hub/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:pkp_hub/features/main/presentation/screens/main_screen.dart';
import 'package:pkp_hub/features/main/presentation/bindings/main_binding.dart';

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
  ];
}
