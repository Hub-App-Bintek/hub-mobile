// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/data/models/response/upload_contract_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/core/utils/formatters.dart';

part 'upload_contract_response.freezed.dart';

@freezed
class UploadContractResponse with _$UploadContractResponse {
  const factory UploadContractResponse({
    String? id,
    String? consultationId,
    String? fileUrl,
    bool? digitalSignature,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UploadContractResponse;

  factory UploadContractResponse.fromJson(Map<String, dynamic> json) {
    return UploadContractResponse(
      id: json['id']?.toString(),
      consultationId: json['consultationId']?.toString(),
      fileUrl: json['fileUrl']?.toString(),
      digitalSignature: json['digitalSignature'] is bool
          ? json['digitalSignature'] as bool
          : (json['digitalSignature']?.toString().toLowerCase() == 'true'),
      status: json['status']?.toString(),
      createdAt: Formatters.tryParseIso(json['createdAt']?.toString()),
      updatedAt: Formatters.tryParseIso(json['updatedAt']?.toString()),
    );
  }
}
