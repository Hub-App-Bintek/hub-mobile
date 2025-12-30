import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_response.freezed.dart';

part 'file_upload_response.g.dart';

@freezed
class FileUploadResponse with _$FileUploadResponse {
  const factory FileUploadResponse({
    required String id,
    required String originalName,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required String category,
    String? subCategory,
    required String entityId,
    required DateTime uploadedAt,
    required String downloadUrl,
  }) = _FileUploadResponse;

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseFromJson(json);
}
