// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationImpl _$$ConsultationImplFromJson(Map<String, dynamic> json) =>
    _$ConsultationImpl(
      consultationId: json['consultationId'] as String?,
      consultantId: (json['consultantId'] as num?)?.toInt(),
      consultantName: json['consultantName'] as String?,
      scheduledAt: json['scheduledAt'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      currentSurveySchedule: json['currentSurveySchedule'] == null
          ? null
          : CurrentSurveySchedule.fromJson(
              json['currentSurveySchedule'] as Map<String, dynamic>),
      consultationHistory: (json['consultationHistory'] as List<dynamic>?)
          ?.map((e) => ProjectHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentExchange: json['documentExchange'] == null
          ? null
          : DocumentExchange.fromJson(
              json['documentExchange'] as Map<String, dynamic>),
      revisionRequests: (json['revisionRequests'] as List<dynamic>?)
          ?.map(
              (e) => CurrentSurveySchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      surveySchedules: (json['surveySchedules'] as List<dynamic>?)
          ?.map(
              (e) => CurrentSurveySchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      permit: json['permit'] as String?,
    );

Map<String, dynamic> _$$ConsultationImplToJson(_$ConsultationImpl instance) =>
    <String, dynamic>{
      'consultationId': instance.consultationId,
      'consultantId': instance.consultantId,
      'consultantName': instance.consultantName,
      'scheduledAt': instance.scheduledAt,
      'status': instance.status,
      'notes': instance.notes,
      'currentSurveySchedule': instance.currentSurveySchedule,
      'consultationHistory': instance.consultationHistory,
      'documentExchange': instance.documentExchange,
      'revisionRequests': instance.revisionRequests,
      'surveySchedules': instance.surveySchedules,
      'permit': instance.permit,
    };
