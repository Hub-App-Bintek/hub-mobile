/// A centralized repository for all API endpoints used in the application.
abstract class ApiEndpoints {
  // Private constructor to prevent instantiation.
  ApiEndpoints._();

  // --- Auth ---
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  // TODO: Update this later since it doesn't exist in the backend yet.
  static const String resendOtp = '/api/auth/resend-otp';
  static const createProject = '/api/projects';

  // Add other endpoints here as the app grows, for example:
  // static const String forgotPassword = '/api/auth/forgot-password';
}
