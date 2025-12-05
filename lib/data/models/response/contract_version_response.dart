import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_version_response.freezed.dart';
part 'contract_version_response.g.dart';

@freezed
class ContractVersionResponse with _$ContractVersionResponse {
  const factory ContractVersionResponse({
    String? id,
    String? consultationId,
    ContractDocumentInfo? documentInfo,
    String? contractStatus,
    String? createdAt,
    String? updatedAt,
  }) = _ContractVersionResponse;

  factory ContractVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractVersionResponseFromJson(json);
}

@freezed
class ContractDocumentInfo with _$ContractDocumentInfo {
  const factory ContractDocumentInfo({
    String? documentType,
    String? version,
    String? fileUrl,
    String? fileId,
    String? uploadedBy,
    String? status,
    String? notes,
    String? uploadedAt,
  }) = _ContractDocumentInfo;

  factory ContractDocumentInfo.fromJson(Map<String, dynamic> json) =>
      _$ContractDocumentInfoFromJson(json);
}
