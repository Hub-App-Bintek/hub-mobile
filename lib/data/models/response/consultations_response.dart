import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultation_projects.dart';

part 'consultations_response.freezed.dart';
part 'consultations_response.g.dart';

@freezed
class ConsultationsResponse with _$ConsultationsResponse {
  const ConsultationsResponse._();

  const factory ConsultationsResponse({
    ConsultationProjects? projects,
    int? inProgressCount,
    int? pendingCount,
    int? doneCount,
  }) = _ConsultationsResponse;

  factory ConsultationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationsResponseFromJson(json);
}
