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
import 'package:pkp_hub/features/main/bindings/projects_binding.dart';
import 'package:pkp_hub/features/main/screens/main_screen.dart';
import 'package:pkp_hub/features/main/screens/projects_screen.dart';
import 'package:pkp_hub/features/payment/bindings/payment_binding.dart';
import 'package:pkp_hub/features/payment/screens/payment_qr_screen.dart';
import 'package:pkp_hub/features/payment/screens/payment_receipt_screen.dart';
import 'package:pkp_hub/features/payment/screens/payment_screen.dart';
import 'package:pkp_hub/features/project/bindings/create_project_binding.dart';
import 'package:pkp_hub/features/project/bindings/project_details_binding.dart';
import 'package:pkp_hub/features/project/screens/create_project_screen.dart';
import 'package:pkp_hub/features/consultant/bindings/consultant_list_binding.dart';
import 'package:pkp_hub/features/consultant/screens/consultants_screen.dart';
import 'package:pkp_hub/features/consultant/bindings/consultant_portfolio_binding.dart';
import 'package:pkp_hub/features/consultant/screens/consultant_portfolios_screen.dart';
import 'package:pkp_hub/features/project/screens/project_details_screen.dart';
import 'package:pkp_hub/features/project/screens/project_review_screen.dart';
import 'package:pkp_hub/features/inbox/screens/inbox_screen.dart';
import 'package:pkp_hub/features/inbox/bindings/inbox_binding.dart';
import 'package:pkp_hub/features/chat/screens/chat_screen.dart';
import 'package:pkp_hub/features/chat/bindings/chat_binding.dart';

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
      name: _Paths.consultants,
      page: () => const ConsultantsScreen(),
      binding: ConsultantListBinding(),
    ),
    GetPage(
      name: _Paths.projects,
      page: () => const ProjectsScreen(controllerTag: ProjectsBinding.routeTag),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: _Paths.projectReview,
      page: () => const ProjectReviewScreen(),
    ),
    // Consultant portfolio screen
    GetPage(
      name: _Paths.consultantPortfolio,
      page: () => const ConsultantPortfoliosScreen(),
      binding: ConsultantPortfolioBinding(),
    ),
    // Project details screen
    GetPage(
      name: _Paths.projectDetails,
      page: () => const ProjectDetailsScreen(),
      binding: ProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.inbox,
      page: () => const InboxScreen(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => const PaymentScreen(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentQr,
      page: () => const PaymentQrScreen(),
      binding: PaymentBinding(), // Use the same binding to access the same controller instance
    ),
    GetPage(
      name: AppRoutes.paymentReceipt,
      page: () => const PaymentReceiptScreen(),
      binding: PaymentBinding(),
    ),
  ];
}
