// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_on_portfolios.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantOnPortfoliosImpl _$$ConsultantOnPortfoliosImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultantOnPortfoliosImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  specialization: json['specialization'] as String,
);

Map<String, dynamic> _$$ConsultantOnPortfoliosImplToJson(
  _$ConsultantOnPortfoliosImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'specialization': instance.specialization,
};
