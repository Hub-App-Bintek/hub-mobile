import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/participant.dart';

part 'chat_details.freezed.dart';
part 'chat_details.g.dart';

@freezed
class ChatDetails with _$ChatDetails {
  const factory ChatDetails({String? roomId, List<Participant>? participants}) =
      _ChatDetails;

  factory ChatDetails.fromJson(Map<String, dynamic> json) =>
      _$ChatDetailsFromJson(json);
}
