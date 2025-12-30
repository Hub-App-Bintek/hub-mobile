import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_document_model.freezed.dart';

part 'monitoring_document_model.g.dart';

@freezed
class MonitoringDocumentModel with _$MonitoringDocumentModel {
  const factory MonitoringDocumentModel({
    required int id,
    required int monitoringId,
    required int uploadedBy,
    required String uploaderName,
    required String documentUrl,
    required String title,
    String? description,
    required DateTime createdAt,
  }) = _MonitoringDocumentModel;

  factory MonitoringDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringDocumentModelFromJson(json);
}
