import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation.freezed.dart';
part 'consultation.g.dart';

@freezed
class Consultation with _$Consultation {
  const factory Consultation({
    String? projectId,
    String? projectName,
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? city,
    String? status,
    String? state,
  }) = _Consultation;

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
}
