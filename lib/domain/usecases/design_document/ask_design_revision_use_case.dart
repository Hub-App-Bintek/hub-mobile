import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/design_document_revision_response.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class AskDesignRevisionParams {
  const AskDesignRevisionParams({
    required this.consultationId,
    required this.designDocumentId,
    required this.notes,
  });

  final String consultationId;
  final String designDocumentId;
  final String notes;
}

class AskDesignRevisionUseCase
    extends UseCase<DesignDocumentRevisionResponse, AskDesignRevisionParams> {
  final DesignDocumentRepository _repository;

  AskDesignRevisionUseCase(this._repository);

  @override
  Future<Result<DesignDocumentRevisionResponse, Failure>> call(
    AskDesignRevisionParams params,
  ) {
    return _repository.askDesignRevision(
      consultationId: params.consultationId,
      designDocumentId: params.designDocumentId,
      notes: params.notes,
    );
  }
}
