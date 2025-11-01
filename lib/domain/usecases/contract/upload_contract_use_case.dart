// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/contract/upload_contract_use_case.dart
import 'dart:io';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class UploadContractParams {
  final String consultationId;
  final File file;
  final double contractValue;
  UploadContractParams({
    required this.consultationId,
    required this.file,
    required this.contractValue,
  });
}

class UploadContractUseCase extends UseCase<Contract, UploadContractParams> {
  final ContractRepository _repository;
  UploadContractUseCase(this._repository);

  @override
  Future<Result<Contract, Failure>> call(UploadContractParams params) {
    return _repository.uploadContract(
      params.consultationId,
      params.file,
      params.contractValue,
    );
  }
}
