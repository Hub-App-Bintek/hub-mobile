part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const verifyOtp = _Paths.verifyOtp;
  static const main = _Paths.main;
  static const consultation = _Paths.consultation;
  static const consultantDetails = _Paths.consultantDetails;
  static const consultants = _Paths.consultants;
  static const inbox = _Paths.inbox;
  static const chats = _Paths.chats;
  static const chat = _Paths.chat;
  static const consultationDetails = _Paths.consultationDetails;
  static const licensing = _Paths.licensing;
  static const material = _Paths.material;
  static const construction = _Paths.construction;
  static const monitoring = _Paths.monitoring;
  static const kyc = _Paths.kyc;
  static const createProject = _Paths.createProject;
  static const projectHistory = _Paths.projectHistory;
  static const projectContracts = _Paths.projectContracts;
  static const projectDraftDesign = _Paths.projectDraftDesign;
  static const projectFinalDesign = _Paths.projectFinalDesign;
  static const projectInvoice = _Paths.projectInvoice;
  static const projectReview = _Paths.projectReview;
  static const projects = _Paths.projects;
  static const designType = _Paths.designType;
  static const prototypeDesigns = _Paths.prototypeDesigns;
  static const prototypeDesignDetails = _Paths.prototypeDesignDetails;
  static const payment = _Paths.payment;
  static const paymentQr = _Paths.paymentQr;
  static const paymentReceipt = _Paths.paymentReceipt;
}

abstract class _Paths {
  static const login = '/login';
  static const register = '/register';
  static const verifyOtp = '/verify-otp';
  static const main = '/main';
  static const consultation = '/consultation';
  static const consultantDetails = '/consultation-details';
  static const consultants = '/consultants';
  static const inbox = '/inbox';
  static const chats = '/chats';
  static const chat = '/chat';
  static const consultationDetails = '/consultation-details-screen';
  static const licensing = '/licensing';
  static const material = '/material';
  static const construction = '/construction';
  static const monitoring = '/monitoring';
  static const kyc = '/kyc';
  static const createProject = '/create-project';
  static const projectHistory = '/project-history';
  static const projectReview = '/project-review';
  static const projectContracts = '/project-contracts';
  static const projectDraftDesign = '/project-draft-design';
  static const projectFinalDesign = '/project-final-design';
  static const projectInvoice = '/project-invoice';
  static const projects = '/projects';
  static const designType = '/design-type';
  static const prototypeDesigns = '/prototype-designs';
  static const prototypeDesignDetails = '/prototype-design-details';
  static const payment = '/payment';
  static const paymentQr = '/payment/qr';
  static const paymentReceipt = '/payment/receipt';
}
