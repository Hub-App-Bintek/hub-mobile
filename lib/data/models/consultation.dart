import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/current_survey_schedule.dart';
import 'package:pkp_hub/data/models/document_exchange.dart';
import 'package:pkp_hub/data/models/project_history.dart';

part 'consultation.freezed.dart';
part 'consultation.g.dart';

@freezed
class Consultation with _$Consultation {
  const factory Consultation({
    String? consultationId,
    int? consultantId,
    String? consultantName,
    String? scheduledAt,
    String? status,
    String? notes,
    CurrentSurveySchedule? currentSurveySchedule,
    List<ProjectHistory>? consultationHistory,
    DocumentExchange? documentExchange,
    List<CurrentSurveySchedule>? revisionRequests,
    List<CurrentSurveySchedule>? surveySchedules,
    String? permit,
  }) = _Consultation;

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
}
