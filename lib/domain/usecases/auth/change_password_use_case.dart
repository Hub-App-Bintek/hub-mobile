import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/change_password_request.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class ChangePasswordUseCase implements UseCase<void, ChangePasswordRequest> {
  ChangePasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void, Failure>> call(ChangePasswordRequest params) {
    return _repository.changePassword(params);
  }
}
