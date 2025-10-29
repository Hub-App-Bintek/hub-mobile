// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyResponseImpl _$$SurveyResponseImplFromJson(Map<String, dynamic> json) =>
    _$SurveyResponseImpl(
      id: json['id'] as String?,
      consultationId: json['consultationId'] as String?,
      proposedDateTime: json['proposedDateTime'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$SurveyResponseImplToJson(
  _$SurveyResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'consultationId': instance.consultationId,
  'proposedDateTime': instance.proposedDateTime,
  'notes': instance.notes,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
