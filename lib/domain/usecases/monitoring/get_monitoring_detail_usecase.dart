import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/data/models/monitoring_detail_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetMonitoringDetailUseCase
    implements UseCase<MonitoringDetailModel, int> {
  final MonitoringRepository _repository;

  GetMonitoringDetailUseCase(this._repository);

  @override
  Future<Result<MonitoringDetailModel, Failure>> call(int params) {
    return _repository.getMonitoringDetail(params);
  }
}