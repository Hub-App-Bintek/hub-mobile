import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/auth_api_service.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';
import 'package:pkp_hub/data/models/response/register_response.dart';
import 'package:dio/dio.dart';

abstract class AuthNetworkDataSource {
  Future<Result<LoginResponse, Failure>> login(LoginRequest request);

  Future<Result<RegisterResponse, Failure>> register(RegisterRequest request);

  Future<Result<LoginResponse, Failure>> verifyOtp(VerifyOtpRequest request);

  Future<Result<void, Failure>> resendOtp(String email);
}

class AuthNetworkDataSourceImpl implements AuthNetworkDataSource {
  final ApiClient _apiClient;
  final AuthApiService _authApi;

  AuthNetworkDataSourceImpl(this._apiClient, this._authApi);

  @override
  Future<Result<LoginResponse, Failure>> login(LoginRequest request) async {
    try {
      final response = await _authApi.login(request);
      if (response.token?.isEmpty == true) {
        return const Error(
          ServerFailure(message: 'Invalid login response: token is empty'),
        );
      }
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse login response: $e'),
      );
    }
  }

  @override
  Future<Result<RegisterResponse, Failure>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _authApi.register(request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse register response: $e'),
      );
    }
  }

  @override
  Future<Result<LoginResponse, Failure>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    try {
      final response = await _authApi.verifyOtp(request);
      if (response.token?.isEmpty == true) {
        return const Error(
          ServerFailure(message: 'Invalid OTP response: token is empty'),
        );
      }
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse OTP response: $e'));
    }
  }

  @override
  Future<Result<void, Failure>> resendOtp(String email) async {
    try {
      // Using flexible map payload to accommodate backend variations
      await _authApi.resendOtp({'email': email});
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: e.toString()));
    }
  }
}
