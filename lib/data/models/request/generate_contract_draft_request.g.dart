// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_contract_draft_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateContractDraftRequestImpl _$$GenerateContractDraftRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateContractDraftRequestImpl(
  contractValue: (json['contractValue'] as num).toDouble(),
  installments: (json['installments'] as List<dynamic>)
      .map((e) => Installment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$GenerateContractDraftRequestImplToJson(
  _$GenerateContractDraftRequestImpl instance,
) => <String, dynamic>{
  'contractValue': instance.contractValue,
  'installments': instance.installments,
};
