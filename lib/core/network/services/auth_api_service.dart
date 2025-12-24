// Retrofit API service for authentication endpoints.
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/forgot_password_request.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/data/models/request/register_device_token_request.dart';
import 'package:pkp_hub/data/models/request/reset_password_request.dart';
import 'package:pkp_hub/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/data/models/request/verify_forgot_password_otp_request.dart';
import 'package:pkp_hub/data/models/response/forgot_password_verification_response.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';
import 'package:pkp_hub/data/models/response/register_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(ApiEndpoints.login)
  Future<LoginResponse> login(@Body() LoginRequest body);

  @MultiPart()
  @POST(ApiEndpoints.register)
  Future<RegisterResponse> register(@Body() FormData body);

  @POST(ApiEndpoints.verifyOtp)
  Future<LoginResponse> verifyOtp(@Body() VerifyOtpRequest body);

  // We don't need the response payload here; avoid Map parsing issues.
  @POST(ApiEndpoints.resendOtp)
  Future<void> resendOtp(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequest body);

  @POST(ApiEndpoints.verifyForgotPasswordOtp)
  Future<ForgotPasswordVerificationResponse> verifyForgotPasswordOtp(
    @Body() VerifyForgotPasswordOtpRequest body,
  );

  @POST(ApiEndpoints.resetPassword)
  Future<void> resetPassword(@Body() ResetPasswordRequest body);

  @POST(ApiEndpoints.registerDeviceToken)
  Future<void> registerDeviceToken(@Body() RegisterDeviceTokenRequest body);
}
