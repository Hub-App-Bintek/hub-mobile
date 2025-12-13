// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_document_revision_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DesignDocumentRevisionResponseImpl
_$$DesignDocumentRevisionResponseImplFromJson(Map<String, dynamic> json) =>
    _$DesignDocumentRevisionResponseImpl(
      id: json['id'] as String?,
      designDocumentId: json['designDocumentId'] as String?,
      homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      status: json['status'] as String?,
      remainingRequests: (json['remainingRequests'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DesignDocumentRevisionResponseImplToJson(
  _$DesignDocumentRevisionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'designDocumentId': instance.designDocumentId,
  'homeOwnerId': instance.homeOwnerId,
  'notes': instance.notes,
  'status': instance.status,
  'remainingRequests': instance.remainingRequests,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
