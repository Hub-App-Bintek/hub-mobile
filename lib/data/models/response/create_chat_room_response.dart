import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/participant.dart';

part 'create_chat_room_response.freezed.dart';
part 'create_chat_room_response.g.dart';

@freezed
class CreateChatRoomResponse with _$CreateChatRoomResponse {
  const factory CreateChatRoomResponse({
    String? id,
    String? name,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    List<Participant>? participants,
  }) = _CreateChatRoomResponse;

  factory CreateChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChatRoomResponseFromJson(json);
}
