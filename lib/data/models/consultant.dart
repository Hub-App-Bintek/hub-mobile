import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultant.freezed.dart';
part 'consultant.g.dart';

@freezed
class Consultant with _$Consultant {
  const factory Consultant({
    required int id,
    required String name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? specialization,
    double? rating,
  }) = _Consultant;

  factory Consultant.fromJson(Map<String, dynamic> json) => _$ConsultantFromJson(json);
}

