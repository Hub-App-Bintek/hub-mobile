import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/chat_details.dart';
import 'package:pkp_hub/data/models/chat_message.dart';
import 'package:pkp_hub/data/models/pagination.dart';

part 'chat_room_details.freezed.dart';
part 'chat_room_details.g.dart';

@freezed
class ChatRoomDetailsData with _$ChatRoomDetailsData {
  const factory ChatRoomDetailsData({
    String? roomId,
    ChatDetails? chatDetails,
    List<ChatMessage>? messages,
    Pagination? pagination,
  }) = _ChatRoomDetailsData;

  factory ChatRoomDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDetailsDataFromJson(json);
}
