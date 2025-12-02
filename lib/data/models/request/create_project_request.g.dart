// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProjectRequestImpl _$$CreateProjectRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateProjectRequestImpl(
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  locationDetail: json['locationDetail'] as String,
  type: json['type'] as String,
  landArea: (json['landArea'] as num).toDouble(),
  income: (json['income'] as num).toDouble(),
  name: json['name'] as String,
  provinceId: (json['provinceId'] as num).toInt(),
  regencyId: (json['regencyId'] as num).toInt(),
  districtId: (json['districtId'] as num).toInt(),
  villageId: (json['villageId'] as num).toInt(),
);

Map<String, dynamic> _$$CreateProjectRequestImplToJson(
  _$CreateProjectRequestImpl instance,
) => <String, dynamic>{
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'locationDetail': instance.locationDetail,
  'type': instance.type,
  'landArea': instance.landArea,
  'income': instance.income,
  'name': instance.name,
  'provinceId': instance.provinceId,
  'regencyId': instance.regencyId,
  'districtId': instance.districtId,
  'villageId': instance.villageId,
};
