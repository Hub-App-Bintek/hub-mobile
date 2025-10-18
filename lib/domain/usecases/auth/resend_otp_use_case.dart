import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class ResendOtpUseCase implements UseCase<void, String> {
  final AuthRepository _repository;

  ResendOtpUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(String email) {
    return _repository.resendOtp(email);
  }
}
