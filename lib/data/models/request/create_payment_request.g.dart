// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePaymentRequestImpl _$$CreatePaymentRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePaymentRequestImpl(
  amount: json['amount'] as num,
  description: json['description'] as String,
  paymentMethod: json['paymentMethod'] as String,
);

Map<String, dynamic> _$$CreatePaymentRequestImplToJson(
  _$CreatePaymentRequestImpl instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'description': instance.description,
  'paymentMethod': instance.paymentMethod,
};
