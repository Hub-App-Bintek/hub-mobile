import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_document.freezed.dart';
part 'design_document.g.dart';

@freezed
class DesignDocument with _$DesignDocument {
  const factory DesignDocument({
    String? id,
    String? consultationId,
    String? documentType,
    String? version,
    String? versionId,
    String? fileUrl,
    String? fileId,
    String? uploadedBy,
    String? status,
    String? notes,
    String? uploadedAt,
    String? createdAt,
    String? updatedAt,
  }) = _DesignDocument;

  factory DesignDocument.fromJson(Map<String, dynamic> json) =>
      _$DesignDocumentFromJson(json);
}
