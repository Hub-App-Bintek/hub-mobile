import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/files_repository.dart';

class DownloadFileParams {
  final String fileId;
  DownloadFileParams({required this.fileId});
}

class DownloadFileUseCase extends UseCase<DownloadedFile, DownloadFileParams> {
  final FilesRepository _repository;
  DownloadFileUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(DownloadFileParams params) {
    return _repository.downloadFile(params.fileId);
  }
}
