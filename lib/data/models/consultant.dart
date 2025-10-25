import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultant.freezed.dart';
part 'consultant.g.dart';

@freezed
class Consultant with _$Consultant {
  const factory Consultant({
    String? id,
    String? fullName,
    String? specialty,
    double? rating,
    double? distanceKm,
    String? avatarUrl,
    String? location,
    String? type,
    String? experienceLevel,
    String? availabilityStatus,
    String? contactInfo,
    double? hourlyRate,
    double? packageCost,
  }) = _Consultant;

  factory Consultant.fromJson(Map<String, dynamic> json) =>
      _$ConsultantFromJson(json);
}
