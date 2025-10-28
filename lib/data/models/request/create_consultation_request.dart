import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_consultation_request.freezed.dart';
part 'create_consultation_request.g.dart';

@freezed
class CreateConsultationRequest with _$CreateConsultationRequest {
  const factory CreateConsultationRequest({
    required int consultantId,
    required String projectId,
    required String consultationType,
    required String channel,
  }) = _CreateConsultationRequest;

  factory CreateConsultationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateConsultationRequestFromJson(json);
}
