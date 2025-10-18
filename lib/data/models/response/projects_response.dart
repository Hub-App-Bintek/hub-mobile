import 'package:freezed_annotation/freezed_annotation.dart';
import '../project.dart';

part 'projects_response.freezed.dart';
part 'projects_response.g.dart';

@freezed
class ProjectsResponse with _$ProjectsResponse {
  const factory ProjectsResponse({
    required List<Project> data,
  }) = _ProjectsResponse;

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) => _$ProjectsResponseFromJson(json);
}

