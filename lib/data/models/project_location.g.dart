// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectLocationImpl _$$ProjectLocationImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectLocationImpl(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  provinceId: json['provinceId'] as String?,
  provinceName: json['provinceName'] as String?,
  regencyId: json['regencyId'] as String?,
  regencyName: json['regencyName'] as String?,
  districtId: json['districtId'] as String?,
  districtName: json['districtName'] as String?,
  villageId: json['villageId'] as String?,
  villageName: json['villageName'] as String?,
  locationDetail: json['locationDetail'] as String?,
);

Map<String, dynamic> _$$ProjectLocationImplToJson(
  _$ProjectLocationImpl instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'provinceId': instance.provinceId,
  'provinceName': instance.provinceName,
  'regencyId': instance.regencyId,
  'regencyName': instance.regencyName,
  'districtId': instance.districtId,
  'districtName': instance.districtName,
  'villageId': instance.villageId,
  'villageName': instance.villageName,
  'locationDetail': instance.locationDetail,
};
