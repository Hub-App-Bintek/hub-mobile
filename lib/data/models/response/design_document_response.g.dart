// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignDocumentResponseImpl _$$DesignDocumentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DesignDocumentResponseImpl(
  version: json['version'] as String?,
  versionName: json['versionName'] as String?,
  latestUploadedAt: json['latestUploadedAt'] as String?,
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DesignDocument.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DesignDocument>[],
  canDownload: json['canDownload'] as bool?,
);

Map<String, dynamic> _$$DesignDocumentResponseImplToJson(
  _$DesignDocumentResponseImpl instance,
) => <String, dynamic>{
  'version': instance.version,
  'versionName': instance.versionName,
  'latestUploadedAt': instance.latestUploadedAt,
  'documents': instance.documents,
  'canDownload': instance.canDownload,
};
