// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDetailsResponseImpl _$$ProjectDetailsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectDetailsResponseImpl(
  projectId: json['projectId'] as String?,
  name: json['name'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  locationDetail: json['locationDetail'] as String?,
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  landArea: (json['landArea'] as num?)?.toDouble(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  consultation: json['consultation'] == null
      ? null
      : Consultation.fromJson(json['consultation'] as Map<String, dynamic>),
  permit: json['permit'] as Map<String, dynamic>?,
  monitoring: json['monitoring'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$ProjectDetailsResponseImplToJson(
  _$ProjectDetailsResponseImpl instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'name': instance.name,
  'type': instance.type,
  'status': instance.status,
  'locationDetail': instance.locationDetail,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'landArea': instance.landArea,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'consultation': instance.consultation,
  'permit': instance.permit,
  'monitoring': instance.monitoring,
};
