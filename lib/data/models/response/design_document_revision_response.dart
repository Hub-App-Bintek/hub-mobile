import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_document_revision_response.freezed.dart';
part 'design_document_revision_response.g.dart';

@freezed
class DesignDocumentRevisionResponse with _$DesignDocumentRevisionResponse {
  const factory DesignDocumentRevisionResponse({
    String? id,
    String? designDocumentId,
    int? homeOwnerId,
    String? notes,
    String? status,
    int? remainingRequests,
    String? createdAt,
    String? updatedAt,
  }) = _DesignDocumentRevisionResponse;

  factory DesignDocumentRevisionResponse.fromJson(Map<String, dynamic> json) =>
      _$DesignDocumentRevisionResponseFromJson(json);
}
