import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class GenerateContractDraftParams {
  final String consultationId;
  final UploadContractRequest request;

  GenerateContractDraftParams({
    required this.consultationId,
    required this.request,
  });
}

class GenerateContractDraftUseCase
    extends UseCase<DownloadedFile, GenerateContractDraftParams> {
  final ContractRepository _repository;

  GenerateContractDraftUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(
    GenerateContractDraftParams params,
  ) {
    return _repository.generateDraft(
      consultationId: params.consultationId,
      request: params.request,
    );
  }
}
