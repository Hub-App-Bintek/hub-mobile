// Request body for generating contract draft
// JSON shape:
// {
//   "contractValue": 15000000.00,
//   "installments": [
//     { "percentage": 30.0, "dueDate": "2024-12-01" },
//     { "percentage": 40.0, "dueDate": "2024-12-15" },
//     { "percentage": 30.0, "dueDate": "2024-12-30" }
//   ]
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/installment.dart';

part 'generate_contract_draft_request.freezed.dart';
part 'generate_contract_draft_request.g.dart';

@freezed
class GenerateContractDraftRequest with _$GenerateContractDraftRequest {
  const factory GenerateContractDraftRequest({
    required double contractValue,
    required List<Installment> installments,
  }) = _GenerateContractDraftRequest;

  factory GenerateContractDraftRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateContractDraftRequestFromJson(json);
}
