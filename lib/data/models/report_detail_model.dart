import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/response/image_model.dart';

part 'report_detail_model.freezed.dart';

part 'report_detail_model.g.dart';

@freezed
class ReportDetailModel with _$ReportDetailModel {
  const factory ReportDetailModel({
    required int id,
    required int requestId,
    required String title,
    required String summary,
    @JsonKey(defaultValue: [])
    required List<ImageModel> images,
    required DateTime createdAt,
    required int supervisorId,
    required String supervisorName,
  }) = _ReportDetailModel;

  factory ReportDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailModelFromJson(json);
}