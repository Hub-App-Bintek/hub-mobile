// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_revision_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRevisionRequestImpl _$$CreateRevisionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateRevisionRequestImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  priority: json['priority'] as String,
);

Map<String, dynamic> _$$CreateRevisionRequestImplToJson(
  _$CreateRevisionRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'priority': instance.priority,
};
