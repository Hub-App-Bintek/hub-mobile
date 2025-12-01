import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';

class DownloadPrototypeDesignParams {
  final String designId;
  const DownloadPrototypeDesignParams({required this.designId});
}

class DownloadPrototypeDesignUseCase
    extends UseCase<DownloadedFile, DownloadPrototypeDesignParams> {
  DownloadPrototypeDesignUseCase(this._repository);

  final DesignRepository _repository;

  @override
  Future<Result<DownloadedFile, Failure>> call(
    DownloadPrototypeDesignParams params,
  ) async {
    return _repository.downloadPrototypeDesign(params.designId);
  }
}
