// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractImpl _$$ContractImplFromJson(Map<String, dynamic> json) =>
    _$ContractImpl(
      id: json['id'] as String?,
      consultationId: json['consultationId'] as String?,
      documentType: json['documentType'] as String?,
      version: json['version'] as String?,
      fileUrl: json['fileUrl'] as String?,
      fileId: json['fileId'] as String?,
      uploadedBy: json['uploadedBy'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      uploadedAt: json['uploadedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ContractImplToJson(_$ContractImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'consultationId': instance.consultationId,
      'documentType': instance.documentType,
      'version': instance.version,
      'fileUrl': instance.fileUrl,
      'fileId': instance.fileId,
      'uploadedBy': instance.uploadedBy,
      'status': instance.status,
      'notes': instance.notes,
      'uploadedAt': instance.uploadedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
