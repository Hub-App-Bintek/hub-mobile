import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';

class GetRegenciesUseCase extends UseCase<List<Regency>, int> {
  final LocationRepository _repository;

  GetRegenciesUseCase(this._repository);

  @override
  Future<Result<List<Regency>, Failure>> call(int provinceId) {
    return _repository.getRegencies(provinceId);
  }
}
