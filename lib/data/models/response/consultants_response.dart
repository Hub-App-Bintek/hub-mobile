import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/consultant.dart';

part 'consultants_response.freezed.dart';
part 'consultants_response.g.dart';

@freezed
class ConsultantsResponse with _$ConsultantsResponse {
  const factory ConsultantsResponse({
    required List<Consultant> consultants,
  }) = _ConsultantsResponse;

  factory ConsultantsResponse.fromJson(Map<String, dynamic> json) => _$ConsultantsResponseFromJson(json);
}

