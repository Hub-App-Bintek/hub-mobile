// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contract_draft_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadContractRequestImpl _$$UploadContractRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UploadContractRequestImpl(
  contractValue: (json['contractValue'] as num).toDouble(),
  installments:
      (json['installments'] as List<dynamic>?)
          ?.map((e) => Installment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Installment>[],
  fileUrl: json['fileUrl'] as String?,
);

Map<String, dynamic> _$$UploadContractRequestImplToJson(
  _$UploadContractRequestImpl instance,
) => <String, dynamic>{
  'contractValue': instance.contractValue,
  'installments': instance.installments,
  'fileUrl': instance.fileUrl,
};
