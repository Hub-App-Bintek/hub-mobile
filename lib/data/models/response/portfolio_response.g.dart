// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioResponseImpl _$$PortfolioResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PortfolioResponseImpl(
  consultant: Consultant.fromJson(json['consultant'] as Map<String, dynamic>),
  portfolios: (json['portfolios'] as List<dynamic>)
      .map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PortfolioResponseImplToJson(
  _$PortfolioResponseImpl instance,
) => <String, dynamic>{
  'consultant': instance.consultant,
  'portfolios': instance.portfolios,
};
