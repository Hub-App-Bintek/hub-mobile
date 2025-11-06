import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/design_document.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class UploadDesignDocumentsParams {
  final String consultationId;
  final File fileDed;
  final File fileRab;
  final File fileBoq;
  UploadDesignDocumentsParams({
    required this.consultationId,
    required this.fileDed,
    required this.fileRab,
    required this.fileBoq,
  });
}

class UploadDesignDocumentsUseCase
    extends UseCase<DesignDocument, UploadDesignDocumentsParams> {
  final DesignDocumentRepository _repository;
  UploadDesignDocumentsUseCase(this._repository);
  @override
  Future<Result<DesignDocument, Failure>> call(
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
