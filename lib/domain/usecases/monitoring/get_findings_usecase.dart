import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetFindingsUseCase
    implements UseCase<List<MonitoringItemModel>, GetFindingsParams> {
  final MonitoringRepository _repository;

  GetFindingsUseCase(this._repository);

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> call(GetFindingsParams params) {
    return _repository.getFindings(monitoringId: params.monitoringId);
  }
}

class GetFindingsParams {
  final int monitoringId;

  GetFindingsParams({required this.monitoringId});
}