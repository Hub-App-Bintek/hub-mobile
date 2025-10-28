import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/chat/chat_network_data_source.dart';
import 'package:pkp_hub/data/models/chat_message.dart';
import 'package:pkp_hub/data/models/request/send_chat_message_request.dart';

abstract class ChatRepository {
  Future<Result<ChatMessage, Failure>> sendMessage(
    String consultationId,
    SendChatMessageRequest request,
  );
  Future<Result<List<ChatMessage>, Failure>> getMessages(String consultationId);
  Future<Result<ChatMessage, Failure>> getLatestMessage(String consultationId);
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatNetworkDataSource _ds;
  ChatRepositoryImpl(this._ds);

  @override
  Future<Result<ChatMessage, Failure>> sendMessage(
    String consultationId,
    SendChatMessageRequest request,
  ) => _ds.sendMessage(consultationId, request);

  @override
  Future<Result<List<ChatMessage>, Failure>> getMessages(
    String consultationId,
  ) => _ds.getMessages(consultationId);

  @override
  Future<Result<ChatMessage, Failure>> getLatestMessage(
    String consultationId,
  ) => _ds.getLatestMessage(consultationId);
}
