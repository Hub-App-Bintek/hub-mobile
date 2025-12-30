import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/monitoring_request_item.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetMonitoringRequestsUseCase {
  final MonitoringRepository _repository;

  GetMonitoringRequestsUseCase(this._repository);

  Future<Result<List<MonitoringRequestItem>, Failure>> call({
    required String filterBy,
    String? status,
  }) {
    return _repository.getMonitoringRequests(
      filterBy: filterBy,
      status: status,
    );
  }
}
