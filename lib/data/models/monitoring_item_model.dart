import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_item_model.freezed.dart';

part 'monitoring_item_model.g.dart';

@freezed
class MonitoringItemModel with _$MonitoringItemModel {
  const factory MonitoringItemModel({
    required int id,
    required int requestId,
    required String title,
    required DateTime createdAt,
  }) = _MonitoringItemModel;

  factory MonitoringItemModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringItemModelFromJson(json);
}
