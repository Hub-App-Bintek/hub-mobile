import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/design_document.dart';

part 'design_document_response.freezed.dart';
part 'design_document_response.g.dart';

@freezed
class DesignDocumentResponse with _$DesignDocumentResponse {
  const factory DesignDocumentResponse({
    String? version,
    String? versionName,
    String? latestUploadedAt,
    @Default(<DesignDocument>[]) List<DesignDocument> documents,
    bool? canDownload,
  }) = _DesignDocumentResponse;

  factory DesignDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$DesignDocumentResponseFromJson(json);
}
