import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/final_document_repository.dart';

class RejectFinalDocumentsParams {
  final String consultationId;
  final String? notes;
  RejectFinalDocumentsParams({required this.consultationId, this.notes});
}

class RejectFinalDocumentsUseCase
    extends UseCase<void, RejectFinalDocumentsParams> {
  final FinalDocumentRepository _repository;
  RejectFinalDocumentsUseCase(this._repository);
  @override
  Future<Result<void, Failure>> call(RejectFinalDocumentsParams params) {
    return _repository.rejectFinalDocuments(
      params.consultationId,
      notes: params.notes,
    );
  }
}
