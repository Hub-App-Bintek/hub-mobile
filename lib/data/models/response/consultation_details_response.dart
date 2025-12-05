import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_details_response.freezed.dart';
part 'consultation_details_response.g.dart';

@freezed
class ConsultationDetailsResponse with _$ConsultationDetailsResponse {
  const factory ConsultationDetailsResponse({
    String? consultationId,
    String? projectId,
    String? projectName,
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? designId,
    String? designName,
    String? consultationType,
    String? channel,
    String? status,
    String? startedAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
    String? city,
    String? state,
  }) = _ConsultationDetailsResponse;

  factory ConsultationDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationDetailsResponseFromJson(json);
}
