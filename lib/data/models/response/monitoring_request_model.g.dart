// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringRequestModelImpl _$$MonitoringRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$MonitoringRequestModelImpl(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  status: json['status'] as String,
  homeownerId: (json['homeownerId'] as num).toInt(),
  supervisorId: (json['supervisorId'] as num).toInt(),
  projectAddress: json['projectAddress'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MonitoringRequestModelImplToJson(
  _$MonitoringRequestModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
  'homeownerId': instance.homeownerId,
  'supervisorId': instance.supervisorId,
  'projectAddress': instance.projectAddress,
  'createdAt': instance.createdAt.toIso8601String(),
};
