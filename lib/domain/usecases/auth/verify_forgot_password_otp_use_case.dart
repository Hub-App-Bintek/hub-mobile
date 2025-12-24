import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/verify_forgot_password_otp_request.dart';
import 'package:pkp_hub/data/models/response/forgot_password_verification_response.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class VerifyForgotPasswordOtpUseCase
    implements
        UseCase<
          ForgotPasswordVerificationResponse,
          VerifyForgotPasswordOtpRequest
        > {
  VerifyForgotPasswordOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<ForgotPasswordVerificationResponse, Failure>> call(
    VerifyForgotPasswordOtpRequest params,
  ) {
    return _repository.verifyForgotPasswordOtp(params);
  }
}
