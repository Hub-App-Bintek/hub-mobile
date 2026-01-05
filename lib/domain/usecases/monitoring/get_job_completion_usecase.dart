import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/job_completion_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetJobCompletionUseCase {
  final MonitoringRepository _repository;
  GetJobCompletionUseCase(this._repository);

  Future<Result<JobCompletionModel, Failure>> call(int requestId) {
    return _repository.getJobCompletion(requestId);
  }
}
