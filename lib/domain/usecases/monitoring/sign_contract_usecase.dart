import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class SignContractUseCase implements UseCase<void, int> {
  final MonitoringRepository _repository;

  SignContractUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(int contractId) {
    return _repository.signContract(contractId);
  }
}