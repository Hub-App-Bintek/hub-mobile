// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceImpl _$$ProvinceImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceImpl(
      id: (json['id'] as num).toInt(),
      name: json['nama'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geojson: json['geojson'] as String?,
      zoom: (json['zoom'] as num?)?.toInt(),
      kodeDagri: json['kodeDagri'] as String?,
      kodeBps: json['kodeBps'] as String?,
      kodeRkakl: json['kodeRkakl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ProvinceImplToJson(_$ProvinceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geojson': instance.geojson,
      'zoom': instance.zoom,
      'kodeDagri': instance.kodeDagri,
      'kodeBps': instance.kodeBps,
      'kodeRkakl': instance.kodeRkakl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$RegencyImpl _$$RegencyImplFromJson(Map<String, dynamic> json) =>
    _$RegencyImpl(
      id: (json['id'] as num).toInt(),
      name: json['nama'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geojson: json['geojson'] as String?,
      zoom: (json['zoom'] as num?)?.toInt(),
      kodeDagri: json['kodeDagri'] as String?,
      kodeBps: json['kodeBps'] as String?,
      kodeRkakl: json['kodeRkakl'] as String?,
      provinceId: (json['provinceId'] as num?)?.toInt(),
      backlog: (json['backlog'] as num?)?.toInt(),
      rtlh: (json['rtlh'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$RegencyImplToJson(_$RegencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geojson': instance.geojson,
      'zoom': instance.zoom,
      'kodeDagri': instance.kodeDagri,
      'kodeBps': instance.kodeBps,
      'kodeRkakl': instance.kodeRkakl,
      'provinceId': instance.provinceId,
      'backlog': instance.backlog,
      'rtlh': instance.rtlh,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      id: (json['id'] as num).toInt(),
      name: json['nama'] as String,
      regencyId: (json['cityId'] as num?)?.toInt(),
      kodeDagri: json['kodeDagri'] as String?,
      kodeBps: json['kodeBps'] as String?,
      kodeRkakl: json['kodeRkakl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geojson: json['geojson'] as String?,
      zoom: (json['zoom'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'cityId': instance.regencyId,
      'kodeDagri': instance.kodeDagri,
      'kodeBps': instance.kodeBps,
      'kodeRkakl': instance.kodeRkakl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geojson': instance.geojson,
      'zoom': instance.zoom,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$VillageImpl _$$VillageImplFromJson(Map<String, dynamic> json) =>
    _$VillageImpl(
      id: (json['id'] as num).toInt(),
      name: json['nama'] as String,
      districtId: (json['districtId'] as num?)?.toInt(),
      kodeDagri: json['kodeDagri'] as String?,
      kodeBps: json['kodeBps'] as String?,
      kodeRkakl: json['kodeRkakl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geojson: json['geojson'] as String?,
      zoom: (json['zoom'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$VillageImplToJson(_$VillageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'districtId': instance.districtId,
      'kodeDagri': instance.kodeDagri,
      'kodeBps': instance.kodeBps,
      'kodeRkakl': instance.kodeRkakl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geojson': instance.geojson,
      'zoom': instance.zoom,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
