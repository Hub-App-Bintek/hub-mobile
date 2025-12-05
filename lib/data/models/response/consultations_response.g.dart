// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationsResponseImpl _$$ConsultationsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationsResponseImpl(
  projects: json['projects'] == null
      ? null
      : ConsultationProjects.fromJson(json['projects'] as Map<String, dynamic>),
  inProgressCount: (json['inProgressCount'] as num?)?.toInt(),
  pendingCount: (json['pendingCount'] as num?)?.toInt(),
  doneCount: (json['doneCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ConsultationsResponseImplToJson(
  _$ConsultationsResponseImpl instance,
) => <String, dynamic>{
  'projects': instance.projects,
  'inProgressCount': instance.inProgressCount,
  'pendingCount': instance.pendingCount,
  'doneCount': instance.doneCount,
};
