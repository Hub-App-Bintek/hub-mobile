// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringItemModelImpl _$$MonitoringItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringItemModelImpl(
      id: (json['id'] as num).toInt(),
      supervisorId: (json['supervisorId'] as num).toInt(),
      title: json['title'] as String,
      supervisorName: json['supervisorName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MonitoringItemModelImplToJson(
        _$MonitoringItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supervisorId': instance.supervisorId,
      'title': instance.title,
      'supervisorName': instance.supervisorName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
