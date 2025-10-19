// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      location: ProjectLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      landArea: (json['landArea'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'location': instance.location,
      'landArea': instance.landArea,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$ProjectLocationImpl _$$ProjectLocationImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectLocationImpl(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  address: json['address'] as String,
);

Map<String, dynamic> _$$ProjectLocationImplToJson(
  _$ProjectLocationImpl instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
};
