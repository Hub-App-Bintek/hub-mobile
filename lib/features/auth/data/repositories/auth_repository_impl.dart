import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:pkp_hub/features/auth/data/models/request/login_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/register_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/features/auth/data/models/response/login_response.dart';
import 'package:pkp_hub/features/auth/data/models/response/register_response.dart';
import 'package:pkp_hub/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

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
