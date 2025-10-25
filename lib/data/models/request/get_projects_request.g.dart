// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_projects_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetProjectsRequestImpl _$$GetProjectsRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetProjectsRequestImpl(
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$GetProjectsRequestImplToJson(
        _$GetProjectsRequestImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'type': instance.type,
      'status': instance.status,
    };
