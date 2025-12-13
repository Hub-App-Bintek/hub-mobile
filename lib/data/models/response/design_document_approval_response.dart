import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_document_approval_response.freezed.dart';
part 'design_document_approval_response.g.dart';

@freezed
class DesignDocumentApprovalResponse with _$DesignDocumentApprovalResponse {
  const factory DesignDocumentApprovalResponse({
    String? id,
    String? consultationId,
    int? consultantId,
    String? fileDedName,
    String? fileDedUrl,
    String? fileRabName,
    String? fileRabUrl,
    String? fileBoqName,
    String? fileBoqUrl,
    int? version,
    String? approvedVersion,
    String? approvedRevisionNotes,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _DesignDocumentApprovalResponse;

  factory DesignDocumentApprovalResponse.fromJson(Map<String, dynamic> json) =>
      _$DesignDocumentApprovalResponseFromJson(json);
}
