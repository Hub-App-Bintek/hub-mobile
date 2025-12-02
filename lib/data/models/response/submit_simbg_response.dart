// lib/data/models/response/submit_simbg_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_simbg_response.freezed.dart';

part 'submit_simbg_response.g.dart';

@freezed
class SubmitSimbgResponse with _$SubmitSimbgResponse {
  const factory SubmitSimbgResponse({
    required String simbgId,
    required String permitId,
    required String status,
  }) = _SubmitSimbgResponse;

  factory SubmitSimbgResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitSimbgResponseFromJson(json);
}