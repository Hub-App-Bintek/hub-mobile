// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectHistoryImpl _$$ProjectHistoryImplFromJson(Map<String, dynamic> json) =>
    _$ProjectHistoryImpl(
      step: json['step'] as String?,
      state: json['state'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectHistoryImplToJson(
  _$ProjectHistoryImpl instance,
) => <String, dynamic>{
  'step': instance.step,
  'state': instance.state,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'files': instance.files,
  'attachments': instance.attachments,
  'metadata': instance.metadata,
};
