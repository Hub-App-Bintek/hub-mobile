// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_survey_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentSurveyScheduleImpl _$$CurrentSurveyScheduleImplFromJson(
  Map<String, dynamic> json,
) => _$CurrentSurveyScheduleImpl(
  scheduleId: json['scheduleId'] as String?,
  proposedDateTime: json['proposedDateTime'] as String?,
  status: json['status'] as String?,
  notes: json['notes'] as String?,
  proposedBy: json['proposedBy'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  surveyCost: (json['surveyCost'] as num?)?.toDouble(),
  surveyLocation: json['surveyLocation'] as String?,
  estimatedDurationHours: (json['estimatedDurationHours'] as num?)?.toInt(),
  surveyType: json['surveyType'] as String?,
);

Map<String, dynamic> _$$CurrentSurveyScheduleImplToJson(
  _$CurrentSurveyScheduleImpl instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'proposedDateTime': instance.proposedDateTime,
  'status': instance.status,
  'notes': instance.notes,
  'proposedBy': instance.proposedBy,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'surveyCost': instance.surveyCost,
  'surveyLocation': instance.surveyLocation,
  'estimatedDurationHours': instance.estimatedDurationHours,
  'surveyType': instance.surveyType,
};
