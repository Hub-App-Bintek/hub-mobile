import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/chat_api_service.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/chat_room_details_response.dart';
import 'package:pkp_hub/data/models/response/incoming_chat_response.dart';
import 'package:pkp_hub/data/models/request/chat_send_message_request.dart';
import 'package:pkp_hub/data/models/request/mark_chat_read_request.dart';
import 'package:pkp_hub/data/models/response/chat_send_message_response.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';

abstract class ChatNetworkDataSource {
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

class ChatNetworkDataSourceImpl implements ChatNetworkDataSource {
  final ApiClient _apiClient;
  final ChatApiService _chatApi;

  ChatNetworkDataSourceImpl(this._apiClient, this._chatApi);

  @override
  Future<Result<CreateChatRoomResponse, Failure>> createDirectRoom(
    int targetUserId,
  ) async {
    try {
      final room = await _chatApi.createDirectRoom(targetUserId);
      return Success(room);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to create chat room: $e'));
    }
  }

  @override
  Future<Result<ChatRoomDetailsResponse, Failure>> getRoomDetail(
    String roomId, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      final res = await _chatApi.getRoomDetail(roomId, page, limit);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch chat room: $e'));
    }
  }

  @override
  Future<Result<ChatSendMessageResponse, Failure>> sendRoomMessage(
    String roomId,
    ChatSendMessageRequest request,
  ) async {
    try {
      final res = await _chatApi.sendRoomMessage(roomId, request);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to send message: $e'));
    }
  }

  @override
  Future<Result<IncomingChatResponse, Failure>> getIncomingChats({
    int page = 1,
    int limit = 10,
    String? status,
    String? dateRange,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final res = await _chatApi.getIncomingChats(
        page: page,
        limit: limit,
        status: status,
        dateRange: dateRange,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch chats: $e'));
    }
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> getUnreadCount() async {
    try {
      final res = await _chatApi.getUnreadCount();
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to fetch unread count: $e'));
    }
  }

  @override
  Future<Result<UnreadCountResponse, Failure>> markRoomRead(
    String roomId,
    MarkChatReadRequest request,
  ) async {
    try {
      final res = await _chatApi.markRoomRead(roomId, request);
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to mark read: $e'));
    }
  }
}
