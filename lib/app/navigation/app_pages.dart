import 'package:get/get.dart';
import 'package:pkp_hub/features/auth/bindings/forgot_password_binding.dart';
import 'package:pkp_hub/features/auth/bindings/login_binding.dart';
import 'package:pkp_hub/features/auth/bindings/reset_password_binding.dart';
import 'package:pkp_hub/features/auth/bindings/register_binding.dart';
import 'package:pkp_hub/features/auth/bindings/verify_otp_binding.dart';
import 'package:pkp_hub/features/auth/screens/forgot_password_screen.dart';
import 'package:pkp_hub/features/auth/screens/login_screen.dart';
import 'package:pkp_hub/features/auth/screens/reset_password_screen.dart';
import 'package:pkp_hub/features/auth/screens/register_screen.dart';
import 'package:pkp_hub/features/auth/screens/verify_otp_screen.dart';
import 'package:pkp_hub/features/chat/bindings/chat_binding.dart';
import 'package:pkp_hub/features/chat/bindings/chats_binding.dart';
import 'package:pkp_hub/features/chat/screens/chat_screen.dart';
import 'package:pkp_hub/features/chat/screens/chats_screen.dart';
import 'package:pkp_hub/features/consultation/bindings/consultation_binding.dart';
import 'package:pkp_hub/features/consultation/bindings/consultant_details_binding.dart';
import 'package:pkp_hub/features/consultation/bindings/consultants_binding.dart';
import 'package:pkp_hub/features/consultation/bindings/consultation_confirmation_binding.dart';
import 'package:pkp_hub/features/consultation/bindings/consultation_details_binding.dart';
import 'package:pkp_hub/features/consultation/screens/consultant_details_screen.dart';
import 'package:pkp_hub/features/consultation/screens/consultants_screen.dart';
import 'package:pkp_hub/features/consultation/screens/consultation_confirmation_screen.dart';
import 'package:pkp_hub/features/consultation/screens/consultation_details_screen.dart';
import 'package:pkp_hub/features/consultation/screens/consultation_screen.dart';
import 'package:pkp_hub/features/inbox/bindings/inbox_binding.dart';
import 'package:pkp_hub/features/inbox/screens/inbox_screen.dart';
import 'package:pkp_hub/features/kyc/bindings/kyc_binding.dart';
import 'package:pkp_hub/features/kyc/screens/kyc_screen.dart';
import 'package:pkp_hub/features/licensing/bindings/licensing_binding.dart';
import 'package:pkp_hub/features/licensing/bindings/licensing_details_binding.dart';
import 'package:pkp_hub/features/licensing/bindings/licensing_location_details_binding.dart';
import 'package:pkp_hub/features/licensing/bindings/simbg_form_binding.dart';
import 'package:pkp_hub/features/licensing/screens/licensing_details_screen.dart';
import 'package:pkp_hub/features/licensing/screens/licensing_location_details_screen.dart';
import 'package:pkp_hub/features/licensing/screens/licensing_screen.dart';
import 'package:pkp_hub/features/licensing/screens/simbg_form_screen.dart';
import 'package:pkp_hub/features/main/bindings/main_binding.dart';
import 'package:pkp_hub/features/main/bindings/projects_binding.dart';
import 'package:pkp_hub/features/main/screens/main_screen.dart';
import 'package:pkp_hub/features/main/screens/projects_screen.dart';
import 'package:pkp_hub/features/monitoring/bindings/monitoring_binding.dart';
import 'package:pkp_hub/features/monitoring/bindings/monitoring_form_binding.dart';
import 'package:pkp_hub/features/monitoring/bindings/monitoring_detail_binding.dart';
import 'package:pkp_hub/features/monitoring/bindings/monitoring_detail_report_binding.dart';
import 'package:pkp_hub/features/monitoring/bindings/supervisor_binding.dart';
import 'package:pkp_hub/features/monitoring/screens/monitoring_detail_screen.dart';
import 'package:pkp_hub/features/monitoring/screens/monitoring_landing_screen.dart';
import 'package:pkp_hub/features/monitoring/screens/monitoring_location_details_screen.dart';
import 'package:pkp_hub/features/monitoring/screens/monitoring_supervisor_screen.dart';
import 'package:pkp_hub/features/monitoring/screens/report_detail_screen.dart';
import 'package:pkp_hub/features/payment/bindings/payment_binding.dart';
import 'package:pkp_hub/features/payment/screens/payment_qr_screen.dart';
import 'package:pkp_hub/features/payment/screens/payment_receipt_screen.dart';
import 'package:pkp_hub/features/payment/screens/payment_screen.dart';
import 'package:pkp_hub/features/payment/screens/payment_va_screen.dart';
import 'package:pkp_hub/features/project/bindings/design_type_binding.dart';
import 'package:pkp_hub/features/project/bindings/location_details_binding.dart';
import 'package:pkp_hub/features/project/bindings/prototype_design_details_binding.dart';
import 'package:pkp_hub/features/project/bindings/prototype_designs_binding.dart';
import 'package:pkp_hub/features/project/screens/contracts_screen.dart';
import 'package:pkp_hub/features/project/screens/design_type_screen.dart';
import 'package:pkp_hub/features/project/screens/draft_design_screen.dart';
import 'package:pkp_hub/features/project/screens/final_design_screen.dart';
import 'package:pkp_hub/features/project/screens/invoice_screen.dart';
import 'package:pkp_hub/features/project/screens/location_details_screen.dart';
import 'package:pkp_hub/features/project/screens/prototype_design_details_screen.dart';
import 'package:pkp_hub/features/project/screens/prototype_designs_screen.dart';

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
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.verifyOtp,
      page: () => const VerifyOtpScreen(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
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
      name: _Paths.locationDetails,
      page: () => const LocationDetailsScreen(),
      binding: LocationDetailsBinding(),
    ),
    // Consultants list screen
    GetPage(
      name: _Paths.consultation,
      page: () => const ConsultationScreen(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.consultants,
      page: () => const ConsultantsScreen(),
      binding: ConsultantsBinding(),
    ),
    GetPage(
      name: _Paths.projects,
      page: () => const ProjectsScreen(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: _Paths.designType,
      page: () => const DesignTypeScreen(),
      binding: DesignTypeBinding(),
    ),
    GetPage(
      name: _Paths.prototypeDesigns,
      page: () => const PrototypeDesignsScreen(),
      binding: PrototypeDesignsBinding(),
    ),
    GetPage(
      name: _Paths.prototypeDesignDetails,
      page: () => const PrototypeDesignDetailsScreen(),
      binding: PrototypeDesignDetailsBinding(),
    ),
    GetPage(name: _Paths.projectContracts, page: () => const ContractsScreen()),
    GetPage(
      name: _Paths.projectDraftDesign,
      page: () => const DraftDesignScreen(),
    ),
    GetPage(
      name: _Paths.projectFinalDesign,
      page: () => const FinalDesignScreen(),
    ),
    GetPage(name: _Paths.projectInvoice, page: () => const InvoiceScreen()),
    // Consultant portfolio screen
    GetPage(
      name: _Paths.consultantDetails,
      page: () => const ConsultantDetailsScreen(),
      binding: ConsultantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.consultationDetails,
      page: () => const ConsultationDetailsScreen(),
      binding: ConsultationDetailsBinding(),
    ),
    GetPage(
      name: _Paths.inbox,
      page: () => const InboxScreen(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.chats,
      page: () => const ChatsScreen(),
      binding: ChatsBinding(),
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
      binding:
          PaymentBinding(), // Use the same binding to access the same controller instance
    ),
    GetPage(
      name: AppRoutes.paymentVa,
      page: () => const PaymentVAScreen(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentReceipt,
      page: () => const PaymentReceiptScreen(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.consultationConfirmation,
      page: () => const ConsultationConfirmationScreen(),
      binding: ConsultationConfirmationBinding(),
    ),
    GetPage(
      name: AppRoutes.licensingDetails,
      page: () => const LicensingDetailsScreen(),
      binding: LicensingDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.simbgForm,
      page: () => const SIMBGFormScreen(),
      binding: SimbgFormBinding(),
    ),
    GetPage(
      name: AppRoutes.licensing,
      page: () => const LicensingScreen(),
      binding: LicensingBinding(),
    ),
    GetPage(
      name: AppRoutes.licensingLocation,
      page: () => const LicensingLocationDetailsScreen(),
      binding: LicensingLocationDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.monitoring,
      page: () => const MonitoringScreen(),
      binding: MonitoringBinding(),
    ),
    GetPage(
      name: AppRoutes.monitoringDetail,
      page: () => const MonitoringDetailScreen(),
      binding: MonitoringDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.monitoringDetailReport,
      page: () => const MonitoringReportDetailScreen(),
      binding: MonitoringDetailReportBinding(),
    ),
    GetPage(
      name: AppRoutes.monitoringSupervisor,
      page: () => const MonitoringSupervisorScreen(),
      binding: SupervisorBinding(),
    ),
    GetPage(
      name: AppRoutes.monitoringForm,
      page: () => const MonitoringFormScreen(),
      binding: MonitoringFormBinding(),
    ),
  ];
}
