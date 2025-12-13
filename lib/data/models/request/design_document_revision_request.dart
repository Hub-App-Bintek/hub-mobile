import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_document_revision_request.freezed.dart';
part 'design_document_revision_request.g.dart';

@freezed
class DesignDocumentRevisionRequest with _$DesignDocumentRevisionRequest {
  const factory DesignDocumentRevisionRequest({
    required String designDocumentId,
    @Default('') String notes,
  }) = _DesignDocumentRevisionRequest;

  factory DesignDocumentRevisionRequest.fromJson(Map<String, dynamic> json) =>
      _$DesignDocumentRevisionRequestFromJson(json);
}
