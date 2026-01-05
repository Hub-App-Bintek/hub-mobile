import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_completion_model.freezed.dart';
part 'job_completion_model.g.dart';

@freezed
class JobCompletionModel with _$JobCompletionModel {
  const factory JobCompletionModel({
    required int monitoringId,
    required int supervisorId,
    required String supervisorName,
    String? completionDocumentUrl,
    String? completionNotes,
    DateTime? completionRequestedAt,
    required String status,
    required bool isApprovedByHomeowner,
    DateTime? approvedAt,
  }) = _JobCompletionModel;

  factory JobCompletionModel.fromJson(Map<String, dynamic> json) =>
      _$JobCompletionModelFromJson(json);
}
