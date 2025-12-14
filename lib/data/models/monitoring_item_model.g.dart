// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringItemModelImpl _$$MonitoringItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringItemModelImpl(
      id: (json['id'] as num).toInt(),
      requestId: (json['requestId'] as num).toInt(),
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MonitoringItemModelImplToJson(
        _$MonitoringItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestId': instance.requestId,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
    };
