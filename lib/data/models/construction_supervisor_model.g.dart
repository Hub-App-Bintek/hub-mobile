// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construction_supervisor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConstructionSupervisorModelImpl _$$ConstructionSupervisorModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConstructionSupervisorModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: json['type'] as String,
  specialization: json['specialization'] as String,
  rate: (json['rate'] as num).toDouble(),
  availabilityStatus: json['availabilityStatus'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$$ConstructionSupervisorModelImplToJson(
  _$ConstructionSupervisorModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'specialization': instance.specialization,
  'rate': instance.rate,
  'availabilityStatus': instance.availabilityStatus,
  'location': instance.location,
};
