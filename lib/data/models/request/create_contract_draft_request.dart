import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/installment.dart';

part 'create_contract_draft_request.freezed.dart';
part 'create_contract_draft_request.g.dart';

@freezed
class CreateContractDraftRequest with _$CreateContractDraftRequest {
  const factory CreateContractDraftRequest({
    required double contractValue,
    @Default(<Installment>[]) List<Installment> installments,
    String? fileUrl,
  }) = _CreateContractDraftRequest;

  factory CreateContractDraftRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContractDraftRequestFromJson(json);
}
