import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';

class GetVillagesUseCase extends UseCase<List<Village>, int> {
  final LocationRepository _repository;

  GetVillagesUseCase(this._repository);

  @override
  Future<Result<List<Village>, Failure>> call(int districtId) {
    return _repository.getVillages(districtId);
  }
}
