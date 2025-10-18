import 'package:freezed_annotation/freezed_annotation.dart';
import '../project.dart';

part 'get_projects_response.freezed.dart';
part 'get_projects_response.g.dart';

@freezed
class GetProjectsResponse with _$GetProjectsResponse {
  const factory GetProjectsResponse({
    required List<Project> projects,
  }) = _GetProjectsResponse;

  factory GetProjectsResponse.fromJson(Map<String, dynamic> json) => _$GetProjectsResponseFromJson(json);
}

