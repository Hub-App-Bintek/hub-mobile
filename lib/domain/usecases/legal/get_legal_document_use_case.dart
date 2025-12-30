import 'package:pkp_hub/core/enums/legal_document_type.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_base.dart';
import 'package:pkp_hub/domain/repositories/legal_repository.dart';

class GetLegalDocumentUseCase extends UseCase<String, LegalDocumentType> {
  GetLegalDocumentUseCase(this._repository);

  final LegalRepository _repository;

  @override
  Future<Result<String, Failure>> call(LegalDocumentType payload) {
    return _repository.getDocument(payload);
  }
}
