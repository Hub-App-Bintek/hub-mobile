import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/domain/repositories/monitoring_repository.dart';

class GetProfessionalsUseCase
    implements
        UseCase<List<ConstructionSupervisorModel>, GetProfessionalsParams> {
  final MonitoringRepository _repository;

  GetProfessionalsUseCase(this._repository);

  @override
  Future<Result<List<ConstructionSupervisorModel>, Failure>> call(
    GetProfessionalsParams params,
  ) {
    return _repository.getProfessionals(query: params.query);
  }
}

class GetProfessionalsParams {
  final String? query;

  GetProfessionalsParams({this.query});
}
