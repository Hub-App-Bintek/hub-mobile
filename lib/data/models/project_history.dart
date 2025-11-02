import 'package:freezed_annotation/freezed_annotation.dart';

import 'metadata.dart';

part 'project_history.freezed.dart';
part 'project_history.g.dart';

@freezed
class ProjectHistory with _$ProjectHistory {
  const factory ProjectHistory({
    String? step,
    String? state,
    String? title,
    String? subtitle,
    List<String?>? files,
    List<String>? attachments,
    Metadata? metadata,
  }) = _ProjectHistory;

  factory ProjectHistory.fromJson(Map<String, dynamic> json) =>
      _$ProjectHistoryFromJson(json);
}
