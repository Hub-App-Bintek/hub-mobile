import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class CreateMonitoringRequestUseCase
    implements UseCase<void, CreateMonitoringRequestParams> {
  final MonitoringRepository _repository;

  CreateMonitoringRequestUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(CreateMonitoringRequestParams params) {
    return _repository.createMonitoringRequest(
      supervisorId: params.supervisorId,
      projectId: params.projectId,
    );
  }
}

// A parameters class to make the use case call clean and type-safe.
class CreateMonitoringRequestParams {
  final int supervisorId;
  final int projectId;

  CreateMonitoringRequestParams({
    required this.supervisorId,
    required this.projectId,
  });
}