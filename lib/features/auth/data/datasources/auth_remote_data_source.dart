import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/features/auth/data/models/request/login_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/register_request.dart';
import 'package:pkp_hub/features/auth/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/features/auth/data/models/response/login_response.dart';
import 'package:pkp_hub/features/auth/data/models/response/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<Result<LoginResponse, Failure>> login(LoginRequest request);

  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request);

  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request);

  Future<Result<void, Failure>> resendOtp(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<LoginResponse, Failure>> login(LoginRequest request) async {
    const endpoint = ApiEndpoints.login;

    final result = await _apiClient.post(endpoint, data: request.toJson());

    switch (result) {
      case Success(value: final data):
        try {
          final response = LoginResponse.fromJson(data as Map<String, dynamic>);
          if (response.token?.isEmpty == true) {
            return const Error(
              ServerFailure(message: 'Invalid login response: token is empty'),
            );
          }
          return Success(response);
        } catch (e) {
          return Error(
            ServerFailure(message: 'Failed to parse login response: $e'),
          );
        }
      case Error(error: final failure):
        return Error(failure);
    }
  }

  @override
  Future<Result<RegisterResponse, Failure>> register(
    RegisterRequest request,
  ) async {
    const endpoint = ApiEndpoints.register;

    final result = await _apiClient.post(endpoint, data: request.toJson());

    switch (result) {
      case Success(value: final data):
        try {
          final response = RegisterResponse.fromJson(
            data as Map<String, dynamic>,
          );
          return Success(response);
        } catch (e) {
          return Error(
            ServerFailure(message: 'Failed to parse register response: $e'),
          );
        }
      case Error(error: final failure):
        return Error(failure);
    }
  }

  @override
  Future<Result<LoginResponse, Failure>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    const endpoint = ApiEndpoints.verifyOtp;

    final result = await _apiClient.post(endpoint, data: request.toJson());

    switch (result) {
      case Success(value: final data):
        try {
          final response = LoginResponse.fromJson(data as Map<String, dynamic>);
          if (response.token?.isEmpty == true) {
            return const Error(
              ServerFailure(message: 'Invalid OTP response: token is empty'),
            );
          }
          return Success(response);
        } catch (e) {
          return Error(
            ServerFailure(message: 'Failed to parse OTP response: $e'),
          );
        }
      case Error(error: final failure):
        return Error(failure);
    }
  }

  @override
  Future<Result<void, Failure>> resendOtp(String email) async {
    const endpoint = ApiEndpoints.resendOtp;
    final result = await _apiClient.post(endpoint, data: {'email': email});

    switch (result) {
      case Success():
        return const Success(null);
      case Error(error: final failure):
        return Error(failure);
    }
  }
}
