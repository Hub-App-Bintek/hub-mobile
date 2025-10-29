// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_survey_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSurveyScheduleRequestImpl _$$CreateSurveyScheduleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSurveyScheduleRequestImpl(
  proposedDateTime: json['proposedDateTime'] as String,
  surveyCost: (json['surveyCost'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$CreateSurveyScheduleRequestImplToJson(
  _$CreateSurveyScheduleRequestImpl instance,
) => <String, dynamic>{
  'proposedDateTime': instance.proposedDateTime,
  'surveyCost': instance.surveyCost,
  'notes': instance.notes,
};
