import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class DownloadContractVersionParams {
  final String contractId;
  final String documentVersionId;

  DownloadContractVersionParams({
    required this.contractId,
    required this.documentVersionId,
  });
}

class DownloadContractVersionUseCase
    extends UseCase<DownloadedFile, DownloadContractVersionParams> {
  final ContractRepository _repository;

  DownloadContractVersionUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(
    DownloadContractVersionParams params,
  ) {
    return _repository.downloadContractVersion(
      contractId: params.contractId,
      documentVersionId: params.documentVersionId,
    );
  }
}
