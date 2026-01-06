// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_portfolios_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantPortfoliosResponseImpl _$$ConsultantPortfoliosResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultantPortfoliosResponseImpl(
  consultant: json['consultant'] == null
      ? null
      : ConsultantOnPortfolios.fromJson(
          json['consultant'] as Map<String, dynamic>,
        ),
  portfolios: (json['portfolios'] as List<dynamic>?)
      ?.map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ConsultantPortfoliosResponseImplToJson(
  _$ConsultantPortfoliosResponseImpl instance,
) => <String, dynamic>{
  'consultant': instance.consultant,
  'portfolios': instance.portfolios,
};
