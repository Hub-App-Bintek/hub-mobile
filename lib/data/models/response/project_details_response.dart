import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultation_info.dart';
import 'package:pkp_hub/data/models/project_location.dart';

part 'project_details_response.freezed.dart';
part 'project_details_response.g.dart';

@freezed
class ProjectDetailsResponse with _$ProjectDetailsResponse {
  const factory ProjectDetailsResponse({
    String? projectId,
    String? projectName,
    String? projectType,
    String? projectStatus,
    String? projectState,
    String? projectStateDescription,
    ProjectLocation? projectLocation,
    double? landArea,
    String? createdAt,
    String? updatedAt,
    ConsultationInfo? consultationInfo,
  }) = _ProjectDetailsResponse;

  factory ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsResponseFromJson(json);
}
