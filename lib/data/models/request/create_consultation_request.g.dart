// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_consultation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateConsultationRequestImpl _$$CreateConsultationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateConsultationRequestImpl(
  consultantId: (json['consultantId'] as num).toInt(),
  projectId: json['projectId'] as String,
  consultationType: json['consultationType'] as String,
  channel: json['channel'] as String,
);

Map<String, dynamic> _$$CreateConsultationRequestImplToJson(
  _$CreateConsultationRequestImpl instance,
) => <String, dynamic>{
  'consultantId': instance.consultantId,
  'projectId': instance.projectId,
  'consultationType': instance.consultationType,
  'channel': instance.channel,
};
