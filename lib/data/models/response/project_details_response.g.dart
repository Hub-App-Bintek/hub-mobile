// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDetailsResponseImpl _$$ProjectDetailsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectDetailsResponseImpl(
  project: json['project'] == null
      ? null
      : Project.fromJson(json['project'] as Map<String, dynamic>),
  consultation: json['consultation'] == null
      ? null
      : Consultation.fromJson(json['consultation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ProjectDetailsResponseImplToJson(
  _$ProjectDetailsResponseImpl instance,
) => <String, dynamic>{
  'project': instance.project,
  'consultation': instance.consultation,
};
