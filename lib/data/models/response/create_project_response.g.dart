// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProjectResponseImpl _$$CreateProjectResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateProjectResponseImpl(
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$CreateProjectResponseImplToJson(
  _$CreateProjectResponseImpl instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'name': instance.name,
  'type': instance.type,
  'createdAt': instance.createdAt,
};
