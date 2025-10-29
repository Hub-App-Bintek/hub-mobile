import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class GetContractUseCase extends UseCase<Contract, String> {
  final ContractRepository _repository;
  GetContractUseCase(this._repository);

  @override
  Future<Result<Contract, Failure>> call(String consultationId) {
    return _repository.getContract(consultationId);
  }
}
