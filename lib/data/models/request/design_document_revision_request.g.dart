// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_document_revision_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignDocumentRevisionRequestImpl
_$$DesignDocumentRevisionRequestImplFromJson(Map<String, dynamic> json) =>
    _$DesignDocumentRevisionRequestImpl(
      designDocumentId: json['designDocumentId'] as String,
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$$DesignDocumentRevisionRequestImplToJson(
  _$DesignDocumentRevisionRequestImpl instance,
) => <String, dynamic>{
  'designDocumentId': instance.designDocumentId,
  'notes': instance.notes,
};
