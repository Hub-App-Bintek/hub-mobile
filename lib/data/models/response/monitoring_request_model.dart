import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_request_model.freezed.dart';

part 'monitoring_request_model.g.dart';

@freezed
class MonitoringRequestModel with _$MonitoringRequestModel {
  const factory MonitoringRequestModel({
    required int id,
    required String type,
    required String status,
    required int homeownerId,
    required int supervisorId,
    required String projectAddress,
    required DateTime createdAt,
  }) = _MonitoringRequestModel;

  factory MonitoringRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringRequestModelFromJson(json);
}