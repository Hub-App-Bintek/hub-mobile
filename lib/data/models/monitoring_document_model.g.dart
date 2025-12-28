// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringDocumentModelImpl _$$MonitoringDocumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringDocumentModelImpl(
      id: (json['id'] as num).toInt(),
      monitoringId: (json['monitoringId'] as num).toInt(),
      uploadedBy: (json['uploadedBy'] as num).toInt(),
      uploaderName: json['uploaderName'] == null ? '' : json['uploaderName'] as String,
      documentUrl: json['documentUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MonitoringDocumentModelImplToJson(
        _$MonitoringDocumentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'monitoringId': instance.monitoringId,
      'uploadedBy': instance.uploadedBy,
      'uploaderName': instance.uploaderName,
      'documentUrl': instance.documentUrl,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
    };
