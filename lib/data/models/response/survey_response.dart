import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

@freezed
class SurveyResponse with _$SurveyResponse {
  const factory SurveyResponse({
    String? id,
    String? consultationId,
    String? proposedDateTime,
    String? notes,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);
}
