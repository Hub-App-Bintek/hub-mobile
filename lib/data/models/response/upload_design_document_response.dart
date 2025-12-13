import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_design_document_response.freezed.dart';
part 'upload_design_document_response.g.dart';

@freezed
class UploadDesignDocumentResponse with _$UploadDesignDocumentResponse {
  const factory UploadDesignDocumentResponse({
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
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _UploadDesignDocument;

  factory UploadDesignDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadDesignDocumentResponseFromJson(json);
}
