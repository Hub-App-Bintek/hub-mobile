// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentExchangeImpl _$$DocumentExchangeImplFromJson(
  Map<String, dynamic> json,
) => _$DocumentExchangeImpl(
  currentDed: json['currentDed'] as String?,
  currentBoq: json['currentBoq'] as String?,
  currentRab: json['currentRab'] as String?,
  exchangeHistory: json['exchangeHistory'] as List<dynamic>?,
);

Map<String, dynamic> _$$DocumentExchangeImplToJson(
  _$DocumentExchangeImpl instance,
) => <String, dynamic>{
  'currentDed': instance.currentDed,
  'currentBoq': instance.currentBoq,
  'currentRab': instance.currentRab,
  'exchangeHistory': instance.exchangeHistory,
};
