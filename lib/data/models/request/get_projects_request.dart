import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_projects_request.freezed.dart';
part 'get_projects_request.g.dart';

@freezed
class GetProjectsRequest with _$GetProjectsRequest {
  const factory GetProjectsRequest({
    int? page,
    int? size,
    String? type, // PROTOTYPE or NON_PROTOTYPE
    String? status, // SEDANG_BERJALAN, MENUNGGU_KONFIRMASI, SELESAI
  }) = _GetProjectsRequest;

  factory GetProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProjectsRequestFromJson(json);
}
