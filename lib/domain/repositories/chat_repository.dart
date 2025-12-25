import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/chat/chat_network_data_source.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/chat_room_details_response.dart';
import 'package:pkp_hub/data/models/request/chat_send_message_request.dart';
import 'package:pkp_hub/data/models/request/mark_chat_read_request.dart';
import 'package:pkp_hub/data/models/response/chat_send_message_response.dart';
import 'package:pkp_hub/data/models/response/incoming_chat_response.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';

abstract class ChatRepository {
  Future<Result<CreateChatRoomResponse, Failure>> createDirectRoom(
    int targetUserId,
  );

  Future<Result<ChatRoomDetailsResponse, Failure>> getRoomDetail(
    String roomId, {
    int page,
    int limit,
  });

  Future<Result<ChatSendMessageResponse, Failure>> sendRoomMessage(
    String roomId,
    ChatSendMessageRequest request,
  );

  Future<Result<IncomingChatResponse, Failure>> getIncomingChats({
    int page,
    int limit,
    String? status,
    String? dateRange,
    String? sortBy,
    String? sortOrder,
  });

  Future<Result<UnreadCountResponse, Failure>> getUnreadCount();

  Future<Result<UnreadCountResponse, Failure>> markRoomRead(
    String roomId,
    MarkChatReadRequest request,
  );
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatNetworkDataSource _ds;
  ChatRepositoryImpl(this._ds);

  @override
  Future<Result<CreateChatRoomResponse, Failure>> createDirectRoom(
    int targetUserId,
  ) => _ds.createDirectRoom(targetUserId);

  @override
  Future<Result<ChatRoomDetailsResponse, Failure>> getRoomDetail(
    String roomId, {
    int page = 1,
    int limit = 50,
  }) => _ds.getRoomDetail(roomId, page: page, limit: limit);

  @override
  Future<Result<ChatSendMessageResponse, Failure>> sendRoomMessage(
    String roomId,
    ChatSendMessageRequest request,
  ) => _ds.sendRoomMessage(roomId, request);

  @override
  Future<Result<IncomingChatResponse, Failure>> getIncomingChats({
    int page = 1,
    int limit = 10,
    String? status,
    String? dateRange,
    String? sortBy,
    String? sortOrder,
  }) => _ds.getIncomingChats(
    page: page,
    limit: limit,
    status: status,
    dateRange: dateRange,
    sortBy: sortBy,
    sortOrder: sortOrder,
  );

  @override
  Future<Result<UnreadCountResponse, Failure>> getUnreadCount() =>
      _ds.getUnreadCount();

  @override
  Future<Result<UnreadCountResponse, Failure>> markRoomRead(
    String roomId,
    MarkChatReadRequest request,
  ) => _ds.markRoomRead(roomId, request);
}
