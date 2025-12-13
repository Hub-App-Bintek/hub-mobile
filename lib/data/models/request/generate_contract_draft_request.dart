import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_contract_draft_request.freezed.dart';
part 'generate_contract_draft_request.g.dart';

@freezed
class GenerateContractDraftRequest with _$GenerateContractDraftRequest {
  const factory GenerateContractDraftRequest({required double contractValue}) =
      _GenerateContractDraftRequest;

  factory GenerateContractDraftRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateContractDraftRequestFromJson(json);
}
