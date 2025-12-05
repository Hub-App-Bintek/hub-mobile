import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract.freezed.dart';
part 'contract.g.dart';

@freezed
class Contract with _$Contract {
  const factory Contract({
    String? id,
    String? consultationId,
    String? documentType,
    String? version,
    String? fileUrl,
    String? fileId,
    String? uploadedBy,
    String? status,
    String? notes,
    String? uploadedAt,
    String? createdAt,
    String? updatedAt,
  }) = _Contract;

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
}
