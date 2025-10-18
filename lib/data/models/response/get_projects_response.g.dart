// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProjectsResponseImpl _$$GetProjectsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProjectsResponseImpl(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetProjectsResponseImplToJson(
        _$GetProjectsResponseImpl instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
