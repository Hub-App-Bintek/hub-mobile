import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class UploadDesignDocumentsParams {
  final String consultationId;
  final File? fileDed;
  final File? fileRab;
  final File? fileBoq;
  UploadDesignDocumentsParams({
    required this.consultationId,
    this.fileDed,
    this.fileRab,
    this.fileBoq,
  });
}

class UploadDesignDocumentsUseCase
    extends UseCase<UploadDesignDocumentResponse, UploadDesignDocumentsParams> {
  final DesignDocumentRepository _repository;
  UploadDesignDocumentsUseCase(this._repository);
  @override
  Future<Result<UploadDesignDocumentResponse, Failure>> call(
    UploadDesignDocumentsParams params,
  ) {
    return _repository.uploadDesignDocuments(
      consultationId: params.consultationId,
      fileDed: params.fileDed,
      fileRab: params.fileRab,
      fileBoq: params.fileBoq,
    );
  }
}
