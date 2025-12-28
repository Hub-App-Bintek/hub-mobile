import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetMonitoringContractsUsecase
    implements UseCase<List<MonitoringContractModel>, int> {
  final MonitoringRepository _repository;

  GetMonitoringContractsUsecase(this._repository);

  @override
  Future<Result<List<MonitoringContractModel>, Failure>> call(int params) {
    return _repository.getContracts(params);
  }
}