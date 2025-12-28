// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadResponseImpl _$$FileUploadResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadResponseImpl(
      id: json['id'] as String,
      originalName: json['originalName'] as String,
      fileName: json['fileName'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String?,
      entityId: json['entityId'] as String,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      downloadUrl: json['downloadUrl'] as String,
    );

Map<String, dynamic> _$$FileUploadResponseImplToJson(
        _$FileUploadResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalName': instance.originalName,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'mimeType': instance.mimeType,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'entityId': instance.entityId,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'downloadUrl': instance.downloadUrl,
    };
