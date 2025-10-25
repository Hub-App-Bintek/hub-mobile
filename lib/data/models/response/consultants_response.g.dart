// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantsResponseImpl _$$ConsultantsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultantsResponseImpl(
  consultants: (json['consultants'] as List<dynamic>)
      .map((e) => Consultant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ConsultantsResponseImplToJson(
  _$ConsultantsResponseImpl instance,
) => <String, dynamic>{'consultants': instance.consultants};
