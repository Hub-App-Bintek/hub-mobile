import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/data/models/response/register_response.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<RegisterResponse, RegisterRequest> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Result<RegisterResponse, Failure>> call(RegisterRequest params) {
    return _repository.register(params);
  }
}
