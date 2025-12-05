import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/project.dart';

part 'consultation_projects.freezed.dart';
part 'consultation_projects.g.dart';

@freezed
class ConsultationProjects with _$ConsultationProjects {
  const factory ConsultationProjects({
    List<Project>? content,
    Pageable? pageable,
    int? totalElements,
    int? totalPages,
    bool? last,
    int? size,
    int? number,
    Sort? sort,
    int? numberOfElements,
    bool? first,
    bool? empty,
  }) = _ConsultationProjects;

  factory ConsultationProjects.fromJson(Map<String, dynamic> json) =>
      _$ConsultationProjectsFromJson(json);
}

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    int? pageNumber,
    int? pageSize,
    Sort? sort,
    int? offset,
    bool? paged,
    bool? unpaged,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}

@freezed
class Sort with _$Sort {
  const factory Sort({bool? sorted, bool? empty, bool? unsorted}) = _Sort;

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
}
