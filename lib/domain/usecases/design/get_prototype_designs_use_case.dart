import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';

class GetPrototypeDesignsUseCase {
  GetPrototypeDesignsUseCase(this._repository);

  final DesignRepository _repository;

  Future<Result<List<PrototypeDesign>, Failure>> call() {
    return _repository.getPrototypeDesigns();
  }
}
