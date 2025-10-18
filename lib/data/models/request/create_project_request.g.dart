// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProjectRequestImpl _$$CreateProjectRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateProjectRequestImpl(
      name: json['name'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      locationDetail: json['locationDetail'] as String,
      type: json['type'] as String,
      landArea: (json['landArea'] as num).toDouble(),
      income: (json['income'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreateProjectRequestImplToJson(
        _$CreateProjectRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'locationDetail': instance.locationDetail,
      'type': instance.type,
      'landArea': instance.landArea,
      'income': instance.income,
    };
