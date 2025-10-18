// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ProjectTypeEnumMap, json['type']),
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      location:
          ProjectLocation.fromJson(json['location'] as Map<String, dynamic>),
      landArea: (json['landArea'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'type': _$ProjectTypeEnumMap[instance.type]!,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'location': instance.location,
      'landArea': instance.landArea,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ProjectTypeEnumMap = {
  ProjectType.PROTOTYPE: 'PROTOTYPE',
  ProjectType.NON_PROTOTYPE: 'NON_PROTOTYPE',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.ACTIVE: 'ACTIVE',
  ProjectStatus.COMPLETED: 'COMPLETED',
  ProjectStatus.CANCELLED: 'CANCELLED',
};

_$ProjectLocationImpl _$$ProjectLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectLocationImpl(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$ProjectLocationImplToJson(
        _$ProjectLocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'address': instance.address,
    };
