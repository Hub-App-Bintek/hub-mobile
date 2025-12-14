import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_request_model.freezed.dart';

part 'monitoring_request_model.g.dart';

@freezed
class MonitoringResponse with _$MonitoringResponse {
  const factory MonitoringResponse({
    required int id,
    required String type,
    required String status,
    required int homeownerId,
    int? supervisorId,
    required String projectAddress,
    required String projectDescription,
    required DateTime createdAt,
  }) = _MonitoringResponse;

  factory MonitoringResponse.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResponseFromJson(json);
}