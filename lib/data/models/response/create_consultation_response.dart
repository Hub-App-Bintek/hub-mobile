import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_consultation_response.freezed.dart';
part 'create_consultation_response.g.dart';

@freezed
class CreateConsultationResponse with _$CreateConsultationResponse {
  const factory CreateConsultationResponse({
    String? id,
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? consultationType,
    String? channel,
    String? status,
    String? startedAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) = _CreateConsultationResponse;

  factory CreateConsultationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConsultationResponseFromJson(json);
}
