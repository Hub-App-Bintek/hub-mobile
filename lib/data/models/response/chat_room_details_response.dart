import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/chat_room_details.dart';

part 'chat_room_details_response.freezed.dart';
part 'chat_room_details_response.g.dart';

@freezed
class ChatRoomDetailsResponse with _$ChatRoomDetailsResponse {
  const factory ChatRoomDetailsResponse({
    bool? success,
    ChatRoomDetailsData? data,
  }) = _ChatRoomDetailsResponse;

  factory ChatRoomDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDetailsResponseFromJson(json);
}
