import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_request_item.freezed.dart';

part 'monitoring_request_item.g.dart';

@freezed
class MonitoringRequestItem with _$MonitoringRequestItem {
  const factory MonitoringRequestItem({
    required int id,
    required String type,
    required String status,
    required int homeownerId,
    int? supervisorId,
    String? projectAddress,
    required DateTime createdAt,
  }) = _MonitoringRequestItem;

  factory MonitoringRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MonitoringRequestItemFromJson(json);
}
