import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_survey_schedule.freezed.dart';
part 'current_survey_schedule.g.dart';

@freezed
class CurrentSurveySchedule with _$CurrentSurveySchedule {
  const factory CurrentSurveySchedule({
    String? scheduleId,
    String? proposedDateTime,
    String? status,
    String? notes,
    String? proposedBy,
    String? createdAt,
    String? updatedAt,
    int? surveyCost,
    String? surveyLocation,
    int? estimatedDurationHours,
    String? surveyType,
  }) = _CurrentSurveySchedule;

  factory CurrentSurveySchedule.fromJson(Map<String, dynamic> json) =>
      _$CurrentSurveyScheduleFromJson(json);
}
