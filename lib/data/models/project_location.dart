import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_location.freezed.dart';
part 'project_location.g.dart';

@freezed
class ProjectLocation with _$ProjectLocation {
  const factory ProjectLocation({
    double? latitude,
    double? longitude,
    String? address,
  }) = _ProjectLocation;

  factory ProjectLocation.fromJson(Map<String, dynamic> json) =>
      _$ProjectLocationFromJson(json);
}
