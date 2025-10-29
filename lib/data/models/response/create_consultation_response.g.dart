// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consultation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateConsultationResponseImpl _$$CreateConsultationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateConsultationResponseImpl(
  id: json['id'] as String?,
  homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
  homeOwnerName: json['homeOwnerName'] as String?,
  consultantId: (json['consultantId'] as num?)?.toInt(),
  consultantName: json['consultantName'] as String?,
  consultationType: json['consultationType'] as String?,
  channel: json['channel'] as String?,
  status: json['status'] as String?,
  startedAt: json['startedAt'] as String?,
  completedAt: json['completedAt'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$CreateConsultationResponseImplToJson(
  _$CreateConsultationResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeOwnerId': instance.homeOwnerId,
  'homeOwnerName': instance.homeOwnerName,
  'consultantId': instance.consultantId,
  'consultantName': instance.consultantName,
  'consultationType': instance.consultationType,
  'channel': instance.channel,
  'status': instance.status,
  'startedAt': instance.startedAt,
  'completedAt': instance.completedAt,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
