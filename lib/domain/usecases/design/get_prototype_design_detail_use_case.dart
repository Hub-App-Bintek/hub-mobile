import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';

class GetPrototypeDesignDetailUseCase {
  GetPrototypeDesignDetailUseCase(this._repository);

  final DesignRepository _repository;

  Future<Result<PrototypeDesign, Failure>> call(String id) {
    return _repository.getPrototypeDesignById(id);
  }
}
