import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_monitoring_response.freezed.dart';

part 'create_monitoring_response.g.dart';

@freezed
class MonitoringResponse with _$MonitoringResponse {
  const factory MonitoringResponse({
    required int id,
    required String type,
    required String status,
    required int homeownerId,
    int? supervisorId,
    String? projectAddress,
    String? projectDescription,
    required DateTime createdAt,
  }) = _MonitoringResponse;

  factory MonitoringResponse.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResponseFromJson(json);
}