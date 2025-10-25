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
import 'package:pkp_hub/features/consultant/bindings/consultant_list_binding.dart';
import 'package:pkp_hub/features/consultant/screens/consultant_list_screen.dart';
import 'package:pkp_hub/features/consultant/bindings/consultant_portfolio_binding.dart';
import 'package:pkp_hub/features/consultant/screens/consultant_portfolio_screen.dart';

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
    // Consultants list screen
    GetPage(
      name: _Paths.consultation,
      page: () => const ConsultantListScreen(),
      binding: ConsultantListBinding(),
    ),
    // Consultant portfolio screen
    GetPage(
      name: _Paths.consultantPortfolio,
      page: () => const ConsultantPortfoliosScreen(),
      binding: ConsultantPortfolioBinding(),
    ),
  ];
}
