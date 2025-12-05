import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultation.dart';

part 'project_details_response.freezed.dart';
part 'project_details_response.g.dart';

@freezed
class ProjectDetailsResponse with _$ProjectDetailsResponse {
  const factory ProjectDetailsResponse({
    String? projectId,
    String? name,
    String? type,
    String? status,
    String? locationDetail,
    double? longitude,
    double? latitude,
    double? landArea,
    DateTime? createdAt,
    DateTime? updatedAt,
    Consultation? consultation,
    Map<String, dynamic>? permit,
    Map<String, dynamic>? monitoring,
    Map<String,dynamic>? userInfo,
  }) = _ProjectDetailsResponse;

  factory ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsResponseFromJson(json);
}
