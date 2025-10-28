import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/project.dart';

part 'project_details_response.freezed.dart';
part 'project_details_response.g.dart';

@freezed
class ProjectDetailsResponse with _$ProjectDetailsResponse {
  const factory ProjectDetailsResponse({
    Project? project,
    Consultation? consultation,
  }) = _ProjectDetailsResponse;

  factory ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsResponseFromJson(json);
}
