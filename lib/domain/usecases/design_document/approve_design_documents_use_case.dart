import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/design_document_approval_response.dart';
import 'package:pkp_hub/domain/repositories/design_document_repository.dart';

class ApproveDesignDocumentsUseCase
    extends UseCase<DesignDocumentApprovalResponse, ApproveDesignParams> {
  final DesignDocumentRepository _repository;
  ApproveDesignDocumentsUseCase(this._repository);
  @override
  Future<Result<DesignDocumentApprovalResponse, Failure>> call(
    ApproveDesignParams params,
  ) {
    return _repository.approveDesignDocuments(
      params.designDocumentId,
      approvedVersion: params.approvedVersion,
      revisionNotes: params.revisionNotes,
    );
  }
}

class ApproveDesignParams {
  ApproveDesignParams({
    required this.designDocumentId,
    this.approvedVersion,
    this.revisionNotes,
  });

  final String designDocumentId;
  final String? approvedVersion;
  final String? revisionNotes;
}
