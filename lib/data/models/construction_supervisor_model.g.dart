// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construction_supervisor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConstructionSupervisorModelImpl _$$ConstructionSupervisorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConstructionSupervisorModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      specialization: json['specialization'] as String,
      rating: (json['rating'] as num).toDouble(),
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      packageCost: (json['packageCost'] as num?)?.toDouble(),
      availabilityStatus: json['availabilityStatus'] as String,
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$ConstructionSupervisorModelImplToJson(
        _$ConstructionSupervisorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'specialization': instance.specialization,
      'rating': instance.rating,
      'hourlyRate': instance.hourlyRate,
      'packageCost': instance.packageCost,
      'availabilityStatus': instance.availabilityStatus,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
