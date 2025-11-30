import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';

class GetProvincesUseCase extends UseCaseNoParams<List<Province>> {
  final LocationRepository _repository;

  GetProvincesUseCase(this._repository);

  @override
  Future<Result<List<Province>, Failure>> call() {
    return _repository.getProvinces();
  }
}
