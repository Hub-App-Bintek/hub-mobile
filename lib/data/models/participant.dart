import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';
part 'participant.g.dart';

@freezed
class Participant with _$Participant {
  const factory Participant({
    int? id,
    String? name,
    String? email,
    String? avatarUrl,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
