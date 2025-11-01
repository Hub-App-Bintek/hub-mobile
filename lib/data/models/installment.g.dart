// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstallmentImpl _$$InstallmentImplFromJson(Map<String, dynamic> json) =>
    _$InstallmentImpl(
      percentage: (json['percentage'] as num?)?.toDouble(),
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$$InstallmentImplToJson(_$InstallmentImpl instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'dueDate': instance.dueDate,
    };
