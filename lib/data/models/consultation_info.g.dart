// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationInfoImpl _$$ConsultationInfoImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationInfoImpl(
  consultationId: json['consultationId'] as String?,
  homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
  homeOwnerName: json['homeOwnerName'] as String?,
  consultantId: (json['consultantId'] as num?)?.toInt(),
  consultantName: json['consultantName'] as String?,
  consultationStatus: json['consultationStatus'] as String?,
  consultationType: json['consultationType'] as String?,
  channel: json['channel'] as String?,
  startedAt: json['startedAt'] as String?,
  completedAt: json['completedAt'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$$ConsultationInfoImplToJson(
  _$ConsultationInfoImpl instance,
) => <String, dynamic>{
  'consultationId': instance.consultationId,
  'homeOwnerId': instance.homeOwnerId,
  'homeOwnerName': instance.homeOwnerName,
  'consultantId': instance.consultantId,
  'consultantName': instance.consultantName,
  'consultationStatus': instance.consultationStatus,
  'consultationType': instance.consultationType,
  'channel': instance.channel,
  'startedAt': instance.startedAt,
  'completedAt': instance.completedAt,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
