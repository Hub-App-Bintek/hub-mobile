// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstallmentImpl _$$InstallmentImplFromJson(Map<String, dynamic> json) =>
    _$InstallmentImpl(
      value: (json['value'] as num?)?.toDouble(),
      percentage: json['percentage'] as bool?,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$$InstallmentImplToJson(_$InstallmentImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'percentage': instance.percentage,
      'dueDate': instance.dueDate,
    };
