import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_consultation_request.freezed.dart';
part 'accept_consultation_request.g.dart';

@freezed
class AcceptConsultationRequest with _$AcceptConsultationRequest {
  const factory AcceptConsultationRequest({
    required bool needsSurvey,
    String? surveyDate,
    String? surveyTime,
    String? notes,
  }) = _AcceptConsultationRequest;

  factory AcceptConsultationRequest.fromJson(Map<String, dynamic> json) =>
      _$AcceptConsultationRequestFromJson(json);
}
