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
  address: json['address'] as String?,
);

Map<String, dynamic> _$$ProjectLocationImplToJson(
  _$ProjectLocationImpl instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
};
