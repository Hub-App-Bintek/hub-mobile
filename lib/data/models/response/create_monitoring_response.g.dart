// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_monitoring_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringResponseImpl _$$MonitoringResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringResponseImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      status: json['status'] as String,
      homeownerId: (json['homeownerId'] as num).toInt(),
      supervisorId: (json['supervisorId'] as num?)?.toInt(),
      projectAddress: json['projectAddress'] as String?,
      projectDescription: json['projectDescription'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MonitoringResponseImplToJson(
        _$MonitoringResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'homeownerId': instance.homeownerId,
      'supervisorId': instance.supervisorId,
      'projectAddress': instance.projectAddress,
      'projectDescription': instance.projectDescription,
      'createdAt': instance.createdAt.toIso8601String(),
    };
