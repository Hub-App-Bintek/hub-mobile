import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';

class GetPrototypeDesignDetailUseCase extends UseCase<PrototypeDesign, String> {
  GetPrototypeDesignDetailUseCase(this._repository);

  final DesignRepository _repository;

  @override
  Future<Result<PrototypeDesign, Failure>> call(String id) =>
      _repository.getPrototypeDesignById(id);
}
