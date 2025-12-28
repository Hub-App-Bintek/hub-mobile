import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_contract_model.freezed.dart';
part 'monitoring_contract_model.g.dart';

@freezed
class MonitoringContractModel with _$MonitoringContractModel {
  const factory MonitoringContractModel({
    required int id,
    required int monitoringId,
    required int supervisorId,
    required String supervisorName,
    required String documentUrl,
    required String status, // PENDING, DECLINED, ACCEPTED, FULLY_SIGNED, etc.
    required int revisionCount,
    DateTime? homeownerSignedAt,
    DateTime? supervisorSignedAt,
    required DateTime createdAt,
  }) = _MonitoringContractModel;

  factory MonitoringContractModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringContractModelFromJson(json);
}
