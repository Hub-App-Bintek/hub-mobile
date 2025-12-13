// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_document_approval_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignDocumentApprovalResponseImpl
_$$DesignDocumentApprovalResponseImplFromJson(Map<String, dynamic> json) =>
    _$DesignDocumentApprovalResponseImpl(
      id: json['id'] as String?,
      consultationId: json['consultationId'] as String?,
      consultantId: (json['consultantId'] as num?)?.toInt(),
      fileDedName: json['fileDedName'] as String?,
      fileDedUrl: json['fileDedUrl'] as String?,
      fileRabName: json['fileRabName'] as String?,
      fileRabUrl: json['fileRabUrl'] as String?,
      fileBoqName: json['fileBoqName'] as String?,
      fileBoqUrl: json['fileBoqUrl'] as String?,
      version: (json['version'] as num?)?.toInt(),
      approvedVersion: json['approvedVersion'] as String?,
      approvedRevisionNotes: json['approvedRevisionNotes'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DesignDocumentApprovalResponseImplToJson(
  _$DesignDocumentApprovalResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'consultationId': instance.consultationId,
  'consultantId': instance.consultantId,
  'fileDedName': instance.fileDedName,
  'fileDedUrl': instance.fileDedUrl,
  'fileRabName': instance.fileRabName,
  'fileRabUrl': instance.fileRabUrl,
  'fileBoqName': instance.fileBoqName,
  'fileBoqUrl': instance.fileBoqUrl,
  'version': instance.version,
  'approvedVersion': instance.approvedVersion,
  'approvedRevisionNotes': instance.approvedRevisionNotes,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
