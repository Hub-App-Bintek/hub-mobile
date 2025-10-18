import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

// ignore: constant_identifier_names
enum ProjectType { PROTOTYPE, NON_PROTOTYPE }
// ignore: constant_identifier_names
enum ProjectStatus { ACTIVE, COMPLETED, CANCELLED }

@freezed
class Project with _$Project {
  const factory Project({
    required String projectId,
    required String name,
    required ProjectType type,
    required ProjectStatus status,
    required ProjectLocation location,
    required double landArea,
    required DateTime createdAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@freezed
class ProjectLocation with _$ProjectLocation {
  const factory ProjectLocation({
    required double lat,
    required double long,
    required String address,
  }) = _ProjectLocation;

  factory ProjectLocation.fromJson(Map<String, dynamic> json) => _$ProjectLocationFromJson(json);
}
