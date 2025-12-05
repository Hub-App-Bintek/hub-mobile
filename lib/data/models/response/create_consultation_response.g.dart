// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consultation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateConsultationResponseImpl _$$CreateConsultationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateConsultationResponseImpl(
  consultationId: json['consultationId'] as String?,
  homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
  homeOwnerName: json['homeOwnerName'] as String?,
  consultantId: (json['consultantId'] as num?)?.toInt(),
  consultantName: json['consultantName'] as String?,
  designId: json['designId'] as String?,
  designName: json['designName'] as String?,
  consultationType: json['consultationType'] as String?,
  channel: json['channel'] as String?,
  status: json['status'] as String?,
  startedAt: json['startedAt'] as String?,
  completedAt: json['completedAt'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  projectId: json['projectId'] as String?,
);

Map<String, dynamic> _$$CreateConsultationResponseImplToJson(
  _$CreateConsultationResponseImpl instance,
) => <String, dynamic>{
  'consultationId': instance.consultationId,
  'homeOwnerId': instance.homeOwnerId,
  'homeOwnerName': instance.homeOwnerName,
  'consultantId': instance.consultantId,
  'consultantName': instance.consultantName,
  'designId': instance.designId,
  'designName': instance.designName,
  'consultationType': instance.consultationType,
  'channel': instance.channel,
  'status': instance.status,
  'startedAt': instance.startedAt,
  'completedAt': instance.completedAt,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'projectId': instance.projectId,
};
