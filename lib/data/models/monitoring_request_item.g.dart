// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringRequestItemImpl _$$MonitoringRequestItemImplFromJson(
  Map<String, dynamic> json,
) => _$MonitoringRequestItemImpl(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  status: json['status'] as String,
  homeownerId: (json['homeownerId'] as num).toInt(),
  supervisorId: (json['supervisorId'] as num?)?.toInt(),
  projectAddress: json['projectAddress'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MonitoringRequestItemImplToJson(
  _$MonitoringRequestItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
  'homeownerId': instance.homeownerId,
  'supervisorId': instance.supervisorId,
  'projectAddress': instance.projectAddress,
  'createdAt': instance.createdAt.toIso8601String(),
};
