import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class GetDesignDocumentVersionsParams {
  final String consultationId;
  final String? documentType;

  GetDesignDocumentVersionsParams({
    required this.consultationId,
    this.documentType,
  });
}

class GetDesignDocumentVersionsUseCase
    extends
        UseCase<List<DesignDocumentResponse>, GetDesignDocumentVersionsParams> {
  final DesignDocumentRepository _repository;
  GetDesignDocumentVersionsUseCase(this._repository);

  @override
  Future<Result<List<DesignDocumentResponse>, Failure>> call(
    GetDesignDocumentVersionsParams params,
  ) {
    return _repository.getDesignDocumentVersions(
      consultationId: params.consultationId,
      documentType: params.documentType,
    );
  }
}
