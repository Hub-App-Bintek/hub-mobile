import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class ApproveDesignDocumentsUseCase extends UseCase<void, String> {
  final DesignDocumentRepository _repository;
  ApproveDesignDocumentsUseCase(this._repository);
  @override
  Future<Result<void, Failure>> call(String designDocumentId) {
    return _repository.approveDesignDocuments(designDocumentId);
  }
}
