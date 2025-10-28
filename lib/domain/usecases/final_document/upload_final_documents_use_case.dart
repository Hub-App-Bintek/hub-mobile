import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/final_document.dart';
import 'package:pkp_hub/domain/repositories/final_document_repository.dart';

class UploadFinalDocumentsParams {
  final String consultationId;
  final String fileDedUrl;
  final String fileRabUrl;
  final String fileSpektekUrl;
  UploadFinalDocumentsParams({
    required this.consultationId,
    required this.fileDedUrl,
    required this.fileRabUrl,
    required this.fileSpektekUrl,
  });
}

class UploadFinalDocumentsUseCase
    extends UseCase<FinalDocument, UploadFinalDocumentsParams> {
  final FinalDocumentRepository _repository;
  UploadFinalDocumentsUseCase(this._repository);
  @override
  Future<Result<FinalDocument, Failure>> call(
    UploadFinalDocumentsParams params,
  ) {
    return _repository.uploadFinalDocuments(
      consultationId: params.consultationId,
      fileDedUrl: params.fileDedUrl,
      fileRabUrl: params.fileRabUrl,
      fileSpektekUrl: params.fileSpektekUrl,
    );
  }
}
