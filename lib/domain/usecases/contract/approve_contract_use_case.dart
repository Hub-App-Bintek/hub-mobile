import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/request/approve_contract_request.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class ApproveContractUseCase extends UseCase<Contract, ApproveContractParams> {
  final ContractRepository _repository;
  ApproveContractUseCase(this._repository);

  @override
  Future<Result<Contract, Failure>> call(ApproveContractParams params) {
    return _repository.approveContract(
      contractId: params.contractId,
      request: ApproveContractRequest(
        approvedDocumentVersionId: params.approvedDocumentVersionId,
        revisionNotes: params.revisionNotes,
      ),
    );
  }
}

class ApproveContractParams {
  ApproveContractParams({
    required this.contractId,
    required this.approvedDocumentVersionId,
    this.revisionNotes,
  });

  final String contractId;
  final String approvedDocumentVersionId;
  final String? revisionNotes;
}
