// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_consultation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcceptConsultationRequestImpl _$$AcceptConsultationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AcceptConsultationRequestImpl(
  needsSurvey: json['needsSurvey'] as bool,
  surveyDate: json['surveyDate'] as String?,
  surveyTime: json['surveyTime'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$AcceptConsultationRequestImplToJson(
  _$AcceptConsultationRequestImpl instance,
) => <String, dynamic>{
  'needsSurvey': instance.needsSurvey,
  'surveyDate': instance.surveyDate,
  'surveyTime': instance.surveyTime,
  'notes': instance.notes,
};
