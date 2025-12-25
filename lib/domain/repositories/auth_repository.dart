import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/auth/auth_local_data_source.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/models/request/forgot_password_request.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/data/models/request/register_device_token_request.dart';
import 'package:pkp_hub/data/models/request/reset_password_request.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/data/models/request/verify_forgot_password_otp_request.dart';
import 'package:pkp_hub/data/models/response/forgot_password_verification_response.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';
import 'package:pkp_hub/data/models/response/register_response.dart';
import 'package:pkp_hub/data/models/request/change_password_request.dart';

abstract class AuthRepository {
  Future<Result<LoginResponse, Failure>> login(LoginRequest request);

  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request);

  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request);

  Future<Result<void, Failure>> resendOtp(String email);

  Future<Result<void, Failure>> forgotPassword(ForgotPasswordRequest request);

  Future<Result<ForgotPasswordVerificationResponse, Failure>>
  verifyForgotPasswordOtp(VerifyForgotPasswordOtpRequest request);

  Future<Result<void, Failure>> resetPassword(ResetPasswordRequest request);

  Future<Result<void, Failure>> registerDeviceToken(
    RegisterDeviceTokenRequest request,
  );

  Future<Result<void, Failure>> changePassword(ChangePasswordRequest request);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthNetworkDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<LoginResponse, Failure>> login(LoginRequest request) async {
    final result = await _remoteDataSource.login(request);
    if (result is Success<LoginResponse, Failure>) {
      await _localDataSource.saveUser(result.value);
    }
    return result;
  }

  @override
  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request) {
    return _remoteDataSource.register(request);
  }

  @override
  Future<Result<LoginResponse, Failure>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    final result = await _remoteDataSource.verifyOtp(request);
    if (result is Success<LoginResponse, Failure>) {
      await _localDataSource.saveUser(result.value);
    }
    return result;
  }

  @override
  Future<Result<void, Failure>> resendOtp(String email) {
    return _remoteDataSource.resendOtp(email);
  }

  @override
  Future<Result<void, Failure>> forgotPassword(ForgotPasswordRequest request) {
    return _remoteDataSource.forgotPassword(request);
  }

  @override
  Future<Result<ForgotPasswordVerificationResponse, Failure>>
  verifyForgotPasswordOtp(VerifyForgotPasswordOtpRequest request) {
    return _remoteDataSource.verifyForgotPasswordOtp(request);
  }

  @override
  Future<Result<void, Failure>> resetPassword(ResetPasswordRequest request) {
    return _remoteDataSource.resetPassword(request);
  }

  @override
  Future<Result<void, Failure>> registerDeviceToken(
    RegisterDeviceTokenRequest request,
  ) {
    return _remoteDataSource.registerDeviceToken(request);
  }

  @override
  Future<Result<void, Failure>> changePassword(ChangePasswordRequest request) {
    return _remoteDataSource.changePassword(request);
  }
}
