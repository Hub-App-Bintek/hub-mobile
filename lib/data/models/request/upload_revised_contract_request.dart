import 'package:pkp_hub/data/models/installment.dart';

class UploadRevisedContractRequest {
  UploadRevisedContractRequest({
    this.contractValue,
    this.installments,
    this.revisionNotes,
  });

  final double? contractValue;
  final List<Installment>? installments;
  final String? revisionNotes;

  Map<String, dynamic> toJson() => {
    if (contractValue != null) 'contractValue': contractValue,
    if (installments != null)
      'installments': installments!.map((e) => e.toJson()).toList(),
    if (revisionNotes != null) 'revisionNotes': revisionNotes,
  };
}
