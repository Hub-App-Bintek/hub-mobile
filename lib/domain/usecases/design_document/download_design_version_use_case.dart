import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class DownloadDesignVersionParams {
  final String version;
  DownloadDesignVersionParams(this.version);
}

class DownloadDesignVersionUseCase
    extends UseCase<DownloadedFile, DownloadDesignVersionParams> {
  final DesignDocumentRepository _repository;
  DownloadDesignVersionUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(
    DownloadDesignVersionParams params,
  ) {
    return _repository.downloadDesignVersionZip(params.version);
  }
}
