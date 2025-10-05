import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/features/auth/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/features/auth/data/models/response/login_response.dart';
import 'package:pkp_hub/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase implements UseCase<LoginResponse, VerifyOtpRequest> {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<Result<LoginResponse, Failure>> call(VerifyOtpRequest params) {
    return _repository.verifyOtp(params);
  }
}
