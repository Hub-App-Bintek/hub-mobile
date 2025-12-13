import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_contract_request.freezed.dart';
part 'approve_contract_request.g.dart';

@freezed
class ApproveContractRequest with _$ApproveContractRequest {
  const factory ApproveContractRequest({
    required String approvedDocumentVersionId,
    String? revisionNotes,
  }) = _ApproveContractRequest;

  factory ApproveContractRequest.fromJson(Map<String, dynamic> json) =>
      _$ApproveContractRequestFromJson(json);
}
