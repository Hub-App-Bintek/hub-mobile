import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/data/models/response/login_response.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<LoginResponse, LoginRequest> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Result<LoginResponse, Failure>> call(LoginRequest request) {
    return _repository.login(request);
  }
}
