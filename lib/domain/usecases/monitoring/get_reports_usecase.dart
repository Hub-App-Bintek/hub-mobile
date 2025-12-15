import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetReportsUseCase
    implements UseCase<List<MonitoringItemModel>, GetReportsParams> {
  final MonitoringRepository _repository;

  GetReportsUseCase(this._repository);

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> call(
    GetReportsParams params,
  ) {
    return _repository.getReports(monitoringId: params.monitoringId);
  }
}

class GetReportsParams {
  final int monitoringId;

  GetReportsParams({required this.monitoringId});
}
