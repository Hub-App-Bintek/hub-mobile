import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/register_device_token_request.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';

class RegisterDeviceTokenUseCase
    implements UseCase<void, RegisterDeviceTokenRequest> {
  RegisterDeviceTokenUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void, Failure>> call(RegisterDeviceTokenRequest params) {
    return _repository.registerDeviceToken(params);
  }
}
