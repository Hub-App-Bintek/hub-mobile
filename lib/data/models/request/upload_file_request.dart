import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_file_request.freezed.dart';
part 'upload_file_request.g.dart';

@freezed
class UploadFileRequest with _$UploadFileRequest {
  const factory UploadFileRequest({
    required String filePath, // local file path or multipart
    required String fileType, // KTP, Document, or Selfie
  }) = _UploadFileRequest;

  factory UploadFileRequest.fromJson(Map<String, dynamic> json) => _$UploadFileRequestFromJson(json);
}

