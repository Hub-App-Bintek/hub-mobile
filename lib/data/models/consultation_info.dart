import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation_info.freezed.dart';
part 'consultation_info.g.dart';

@freezed
class ConsultationInfo with _$ConsultationInfo {
  const factory ConsultationInfo({
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? status,
  }) = _ConsultationInfo;

  factory ConsultationInfo.fromJson(Map<String, dynamic> json) =>
      _$ConsultationInfoFromJson(json);
}
