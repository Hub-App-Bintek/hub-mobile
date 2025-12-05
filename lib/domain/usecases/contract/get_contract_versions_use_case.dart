import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/contract_version_response.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';

class GetContractVersionsUseCase
    extends UseCase<List<ContractVersionResponse>, GetContractVersionsParams> {
  GetContractVersionsUseCase(this._repository);

  final ContractRepository _repository;

  @override
  Future<Result<List<ContractVersionResponse>, Failure>> call(
    GetContractVersionsParams params,
  ) {
    return _repository.getContractVersions(
      projectId: params.projectId,
      consultationId: params.consultationId,
    );
  }
}

class GetContractVersionsParams {
  const GetContractVersionsParams({
    required this.projectId,
    required this.consultationId,
  });

  final String projectId;
  final String consultationId;
}
