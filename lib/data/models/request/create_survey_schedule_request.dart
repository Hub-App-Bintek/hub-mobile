import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_survey_schedule_request.freezed.dart';
part 'create_survey_schedule_request.g.dart';

@freezed
class CreateSurveyScheduleRequest with _$CreateSurveyScheduleRequest {
  const factory CreateSurveyScheduleRequest({
    /// Unified payload for both create and reschedule
    /// - proposedDateTime: ISO 8601 (UTC), e.g., 2025-10-29T10:00:00Z
    /// - surveyCost: optional (consultant may set during create; omitted for reschedule)
    /// - notes: optional
    required String proposedDateTime,
    double? surveyCost,
    String? notes,
  }) = _CreateSurveyScheduleRequest;

  factory CreateSurveyScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSurveyScheduleRequestFromJson(json);
}
