part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const verifyOtp = _Paths.verifyOtp;
  static const main = _Paths.main;
  static const consultants = _Paths.consultants;
  static const consultantPortfolio = _Paths.consultantPortfolio;
  static const inbox = _Paths.inbox;
  static const chat = _Paths.chat;
  static const licensing = _Paths.licensing;
  static const material = _Paths.material;
  static const construction = _Paths.construction;
  static const monitoring = _Paths.monitoring;
  static const kyc = _Paths.kyc;
  static const createProject = _Paths.createProject;
  static const projectDetails = _Paths.projectDetails;
  static const projectContracts = _Paths.projectContracts;
  static const projectDraftDesign = _Paths.projectDraftDesign;
  static const projectFinalDesign = _Paths.projectFinalDesign;
  static const projectInvoice = _Paths.projectInvoice;
  static const projectReview = _Paths.projectReview;
  static const projects = _Paths.projects;
  static const payment = _Paths.payment;
  static const paymentQr = _Paths.paymentQr;
  static const paymentReceipt = _Paths.paymentReceipt;
}

abstract class _Paths {
  static const login = '/login';
  static const register = '/register';
  static const verifyOtp = '/verify-otp';
  static const main = '/main';
  static const consultants = '/consultants';
  static const consultantPortfolio = '/consultant-portfolio';
  static const inbox = '/inbox';
  static const chat = '/chat';
  static const licensing = '/licensing';
  static const material = '/material';
  static const construction = '/construction';
  static const monitoring = '/monitoring';
  static const kyc = '/kyc';
  static const createProject = '/create-project';
  static const projectDetails = '/project-details';
  static const projectReview = '/project-review';
  static const projectContracts = '/project-contracts';
  static const projectDraftDesign = '/project-draft-design';
  static const projectFinalDesign = '/project-final-design';
  static const projectInvoice = '/project-invoice';
  static const projects = '/projects';
  static const payment = '/payment';
  static const paymentQr = '/payment/qr';
  static const paymentReceipt = '/payment/receipt';
}
