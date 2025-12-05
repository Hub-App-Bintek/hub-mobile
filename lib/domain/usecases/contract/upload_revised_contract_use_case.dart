import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_revised_contract_param.dart';

class UploadRevisedContractUseCase
    extends UseCase<UploadContractResponse, UploadRevisedContractParam> {
  final ContractRepository _repository;
  UploadRevisedContractUseCase(this._repository);

  @override
  Future<Result<UploadContractResponse, Failure>> call(
    UploadRevisedContractParam params,
  ) {
    return _repository.uploadRevisedContract(params);
  }
}
