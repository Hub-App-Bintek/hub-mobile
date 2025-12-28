import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class ApproveCompletionUseCase implements UseCase<void, int> {
  final MonitoringRepository _repository;

  ApproveCompletionUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(int requestId) {
    return _repository.approveCompletion(requestId: requestId);
  }
}