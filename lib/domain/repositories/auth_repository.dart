import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/auth/auth_network_data_source.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';
import 'package:pkp_hub/data/models/response/register_response.dart';

abstract class AuthRepository {
  Future<Result<LoginResponse, Failure>> login(LoginRequest request);

  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request);

  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request);

  Future<Result<void, Failure>> resendOtp(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthNetworkDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<LoginResponse, Failure>> login(LoginRequest request) {
    return _remoteDataSource.login(request);
  }

  @override
  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request) {
    return _remoteDataSource.register(request);
  }

  @override
  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request) {
    return _remoteDataSource.verifyOtp(request);
  }

  @override
  Future<Result<void, Failure>> resendOtp(String email) {
    return _remoteDataSource.resendOtp(email);
  }
}
