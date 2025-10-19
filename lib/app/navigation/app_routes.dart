part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const verifyOtp = _Paths.verifyOtp;
  static const main = _Paths.main;
  static const consultation = _Paths.consultation;
  static const consultantPortfolio = _Paths.consultantPortfolio;
  static const licensing = _Paths.licensing;
  static const material = _Paths.material;
  static const construction = _Paths.construction;
  static const monitoring = _Paths.monitoring;
  static const kyc = _Paths.kyc;
  static const createProject = _Paths.createProject;
}

abstract class _Paths {
  static const login = '/login';
  static const register = '/register';
  static const verifyOtp = '/verify-otp';
  static const main = '/main';
  static const consultation = '/consultation';
  static const consultantPortfolio = '/consultant-portfolio';
  static const licensing = '/licensing';
  static const material = '/material';
  static const construction = '/construction';
  static const monitoring = '/monitoring';
  static const kyc = '/kyc';
  static const createProject = '/create-project';
}
