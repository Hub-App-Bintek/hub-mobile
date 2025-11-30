import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';

class GetDistrictsUseCase extends UseCase<List<District>, int> {
  final LocationRepository _repository;

  GetDistrictsUseCase(this._repository);

  @override
  Future<Result<List<District>, Failure>> call(int regencyId) {
    return _repository.getDistricts(regencyId);
  }
}
