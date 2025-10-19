import 'package:freezed_annotation/freezed_annotation.dart';
import '../project.dart';

part 'get_project_detail_response.freezed.dart';
part 'get_project_detail_response.g.dart';

@freezed
class GetProjectDetailResponse with _$GetProjectDetailResponse {
  const factory GetProjectDetailResponse({required Project project}) =
      _GetProjectDetailResponse;

  factory GetProjectDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProjectDetailResponseFromJson(json);
}
