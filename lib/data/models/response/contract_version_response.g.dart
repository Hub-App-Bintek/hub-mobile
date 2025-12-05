// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_version_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractVersionResponseImpl _$$ContractVersionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ContractVersionResponseImpl(
  id: json['id'] as String?,
  consultationId: json['consultationId'] as String?,
  documentInfo: json['documentInfo'] == null
      ? null
      : ContractDocumentInfo.fromJson(
          json['documentInfo'] as Map<String, dynamic>,
        ),
  contractStatus: json['contractStatus'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$ContractVersionResponseImplToJson(
  _$ContractVersionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'consultationId': instance.consultationId,
  'documentInfo': instance.documentInfo,
  'contractStatus': instance.contractStatus,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_$ContractDocumentInfoImpl _$$ContractDocumentInfoImplFromJson(
  Map<String, dynamic> json,
) => _$ContractDocumentInfoImpl(
  documentType: json['documentType'] as String?,
  version: json['version'] as String?,
  versionId: json['versionId'] as String?,
  fileUrl: json['fileUrl'] as String?,
  fileId: json['fileId'] as String?,
  uploadedBy: json['uploadedBy'] as String?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  uploadedAt: json['uploadedAt'] as String?,
);

Map<String, dynamic> _$$ContractDocumentInfoImplToJson(
  _$ContractDocumentInfoImpl instance,
) => <String, dynamic>{
  'documentType': instance.documentType,
  'version': instance.version,
  'versionId': instance.versionId,
  'fileUrl': instance.fileUrl,
  'fileId': instance.fileId,
  'uploadedBy': instance.uploadedBy,
  'status': instance.status,
  'notes': instance.notes,
  'uploadedAt': instance.uploadedAt,
};
