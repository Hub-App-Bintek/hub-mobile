import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/project_location.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    String? projectId,
    String? name,
    String? type,
    String? status,
    ProjectLocation? location,
    double? landArea,
    DateTime? createdAt,
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
