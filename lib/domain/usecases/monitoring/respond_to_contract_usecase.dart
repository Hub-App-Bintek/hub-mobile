import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class RespondToContractUseCase
    implements UseCase<void, RespondToContractParams> {
  final MonitoringRepository _repository;

  RespondToContractUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(RespondToContractParams params) {
    return _repository.respondToContract(
      contractId: params.contractId,
      approved: params.approved,
      reason: params.reason,
    );
  }
}

class RespondToContractParams {
  final int contractId;
  final bool approved;
  final String reason;

  RespondToContractParams(
      {required this.contractId, required this.approved, required this.reason});
}