import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/features/auth/data/models/request/login_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/register_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/features/auth/data/models/response/login_response.dart';
import 'package:pkp_hub/features/auth/data/models/response/register_response.dart';

/// Abstract class for authentication repository.
/// defines the contract for authentication-related data operations.
abstract class AuthRepository {
  /// Logs in a user with the given credentials.
  ///
  /// Returns a [Result] containing either a [LoginResponse] on success
  /// or a [Failure] on error.
  Future<Result<LoginResponse, Failure>> login(LoginRequest request);

  /// Registers a new user with the given details.
  ///
  /// Returns a [Result] containing a [RegisterResponse] on success
  /// or a [Failure] on error.
  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request);

  /// Verifies the OTP for a given user.
  ///
  /// Returns a [Result] containing a [LoginResponse] (with token) on success
  /// or a [Failure] on error.
  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request);

  /// Requests a new OTP to be sent to the user's email.
  ///
  /// Returns a [Result] containing void on success or a [Failure] on error.
  Future<Result<void, Failure>> resendOtp(String email);
}
