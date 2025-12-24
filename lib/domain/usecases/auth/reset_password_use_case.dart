import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/reset_password_request.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<void, ResetPasswordRequest> {
  ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void, Failure>> call(ResetPasswordRequest params) {
    return _repository.resetPassword(params);
  }
}
