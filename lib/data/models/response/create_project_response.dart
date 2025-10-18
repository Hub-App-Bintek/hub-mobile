import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_response.freezed.dart';
part 'create_project_response.g.dart';

@freezed
class CreateProjectResponse with _$CreateProjectResponse {
  const factory CreateProjectResponse({
    required String projectId,
    required String name,
    required String type,
    required String createdAt,
  }) = _CreateProjectResponse;

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) => _$CreateProjectResponseFromJson(json);
}

