import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';

part 'monitoring_detail_model.freezed.dart';

part 'monitoring_detail_model.g.dart';

@freezed
class MonitoringDetailModel with _$MonitoringDetailModel {
  const factory MonitoringDetailModel({
    required int id,
    required int homeownerId,
    required String homeownerName,
    required String homeownerEmail,
    int? supervisorId,
    String? supervisorName,
    String? supervisorEmail,
    required String projectId,
    required String type,
    required String status,
    String? completionDocumentUrl,
    String? completionNotes,
    DateTime? completionRequestedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int totalReports,
    required int totalFindings,
    required int totalDocuments,
    required int totalContracts,
    MonitoringContractModel? activeContract,
    ReportDetailModel? latestReport,
  }) = _MonitoringDetailModel;

  factory MonitoringDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringDetailModelFromJson(json);
}