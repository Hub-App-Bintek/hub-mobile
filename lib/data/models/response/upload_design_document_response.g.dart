// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_design_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadDesignDocumentImpl _$$UploadDesignDocumentImplFromJson(
  Map<String, dynamic> json,
) => _$UploadDesignDocumentImpl(
  id: json['id'] as String?,
  consultationId: json['consultationId'] as String?,
  consultantId: json['consultantId'] as String?,
  fileDedName: json['fileDedName'] as String?,
  fileDedUrl: json['fileDedUrl'] as String?,
  fileRabName: json['fileRabName'] as String?,
  fileRabUrl: json['fileRabUrl'] as String?,
  fileBoqName: json['fileBoqName'] as String?,
  fileBoqUrl: json['fileBoqUrl'] as String?,
  version: json['version'] as String?,
  status: json['status'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$UploadDesignDocumentImplToJson(
  _$UploadDesignDocumentImpl instance,
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
  'status': instance.status,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
