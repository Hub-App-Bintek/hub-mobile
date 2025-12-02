import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_request.freezed.dart';
part 'create_project_request.g.dart';

@freezed
class CreateProjectRequest with _$CreateProjectRequest {
  const factory CreateProjectRequest({
    required double longitude,
    required double latitude,
    required String locationDetail,
    required String type, // 'PROTOTYPE' or 'NON_PROTOTYPE'
    required double landArea,
    required double income,
    required String name,
    required int provinceId,
    required int regencyId,
    required int districtId,
    required int villageId,
  }) = _CreateProjectRequest;

  factory CreateProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestFromJson(json);
}
