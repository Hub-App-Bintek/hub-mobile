// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_contract_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveContractRequestImpl _$$ApproveContractRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ApproveContractRequestImpl(
  approvedDocumentVersionId: json['approvedDocumentVersionId'] as String,
  revisionNotes: json['revisionNotes'] as String?,
);

Map<String, dynamic> _$$ApproveContractRequestImplToJson(
  _$ApproveContractRequestImpl instance,
) => <String, dynamic>{
  'approvedDocumentVersionId': instance.approvedDocumentVersionId,
  'revisionNotes': instance.revisionNotes,
};
