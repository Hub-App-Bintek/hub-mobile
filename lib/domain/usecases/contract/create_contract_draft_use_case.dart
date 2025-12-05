// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/contract/create_contract_draft_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';

class CreateContractDraftUseCase
    extends UseCase<UploadContractResponse, UploadContractParam> {
  final ContractRepository _repository;
  CreateContractDraftUseCase(this._repository);

  @override
  Future<Result<UploadContractResponse, Failure>> call(
    UploadContractParam params,
  ) {
    return _repository.uploadContract(params);
  }
}
