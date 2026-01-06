// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringItemModelImpl _$$MonitoringItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$MonitoringItemModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  supervisorName: json['supervisorName'] as String?,
  supervisorId: (json['supervisorId'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MonitoringItemModelImplToJson(
  _$MonitoringItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'supervisorName': instance.supervisorName,
  'supervisorId': instance.supervisorId,
  'createdAt': instance.createdAt.toIso8601String(),
};
