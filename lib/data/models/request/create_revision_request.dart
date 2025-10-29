import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_revision_request.freezed.dart';
part 'create_revision_request.g.dart';

@freezed
class CreateRevisionRequest with _$CreateRevisionRequest {
  const factory CreateRevisionRequest({
    required String title,
    required String description,
    required String priority, // HIGH, MEDIUM, LOW
  }) = _CreateRevisionRequest;

  factory CreateRevisionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRevisionRequestFromJson(json);
}
