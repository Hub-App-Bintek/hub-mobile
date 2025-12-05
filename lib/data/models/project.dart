import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultation_info.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    String? projectId,
    String? projectName,
    String? city,
    String? projectStatus,
    String? state,
    String? stateDescription,
    ConsultationInfo? consultationInfo,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
