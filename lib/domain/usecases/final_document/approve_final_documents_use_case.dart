import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/final_document_repository.dart';

class ApproveFinalDocumentsUseCase extends UseCase<void, String> {
  final FinalDocumentRepository _repository;
  ApproveFinalDocumentsUseCase(this._repository);
  @override
  Future<Result<void, Failure>> call(String consultationId) {
    return _repository.approveFinalDocuments(consultationId);
  }
}
