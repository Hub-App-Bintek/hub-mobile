import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_request.freezed.dart';
part 'create_project_request.g.dart';

@freezed
class CreateProjectRequest with _$CreateProjectRequest {
  const factory CreateProjectRequest({
    required String name,
    required double longitude,
    required double latitude,
    required String locationDetail,
    required String type, // e.g. 'CONSULTATION', 'PROTOTYPE', 'NON_PROTOTYPE'
    required double landArea,
    required double buildingArea,
    required double income,
    required String provinceId,
    required String regencyId,
    required String districtId,
    required String villageId,
  }) = _CreateProjectRequest;

  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
}
