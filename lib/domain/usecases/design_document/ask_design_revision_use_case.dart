import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class AskDesignRevisionParams {
  final String designDocumentId;
  final String? notes;
  const AskDesignRevisionParams({required this.designDocumentId, this.notes});
}

class AskDesignRevisionUseCase extends UseCase<void, AskDesignRevisionParams> {
  final DesignDocumentRepository _repository;
  AskDesignRevisionUseCase(this._repository);
  @override
  Future<Result<void, Failure>> call(AskDesignRevisionParams params) {
    return _repository.askDesignRevision(
      designDocumentId: params.designDocumentId,
      notes: params.notes,
    );
  }
}
