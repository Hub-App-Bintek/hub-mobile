// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      dateTime: json['dateTime'] as String?,
      actor: json['actor'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      contractId: json['contractId'] as String?,
      surveyCost: (json['surveyCost'] as num?)?.toDouble(),
      scheduleId: json['scheduleId'] as String?,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'actor': instance.actor,
      'status': instance.status,
      'notes': instance.notes,
      'contractId': instance.contractId,
      'surveyCost': instance.surveyCost,
      'scheduleId': instance.scheduleId,
    };
