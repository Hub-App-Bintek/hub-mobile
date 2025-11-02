import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class AskContractRevisionUseCase
    extends UseCase<Contract, AskContractRevisionParams> {
  final ContractRepository _repository;
  AskContractRevisionUseCase(this._repository);

  @override
  Future<Result<Contract, Failure>> call(AskContractRevisionParams params) {
    return _repository.requestRevision(params.contractId, params.revisionNotes);
  }
}

class AskContractRevisionParams {
  final String contractId;
  final String? revisionNotes;

  AskContractRevisionParams({
    required this.contractId,
    required this.revisionNotes,
  });
}
