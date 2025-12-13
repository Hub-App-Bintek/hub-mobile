import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/installment.dart';

part 'create_contract_draft_request.freezed.dart';
part 'create_contract_draft_request.g.dart';

@freezed
class UploadContractRequest with _$UploadContractRequest {
  const factory UploadContractRequest({
    required double contractValue,
    @Default(<Installment>[]) List<Installment> installments,
    String? fileUrl,
  }) = _UploadContractRequest;

  factory UploadContractRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadContractRequestFromJson(json);
}
