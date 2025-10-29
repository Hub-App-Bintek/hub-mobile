import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/chat_api_service.dart';
import 'package:pkp_hub/data/models/chat_message.dart';
import 'package:pkp_hub/data/models/request/send_chat_message_request.dart';

abstract class ChatNetworkDataSource {
  Future<Result<ChatMessage, Failure>> sendMessage(
    String consultationId,
    SendChatMessageRequest request,
  );

  Future<Result<List<ChatMessage>, Failure>> getMessages(String consultationId);

  Future<Result<ChatMessage, Failure>> getLatestMessage(String consultationId);
}

class ChatNetworkDataSourceImpl implements ChatNetworkDataSource {
  final ApiClient _apiClient;
  final ChatApiService _chatApi;

  ChatNetworkDataSourceImpl(this._apiClient, this._chatApi);

  @override
  Future<Result<ChatMessage, Failure>> sendMessage(
    String consultationId,
    SendChatMessageRequest request,
  ) async {
    try {
      final response = await _chatApi.sendMessage(consultationId, request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse send message: $e'));
    }
  }

  @override
  Future<Result<List<ChatMessage>, Failure>> getMessages(
    String consultationId,
  ) async {
    try {
      final response = await _chatApi.getMessages(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse messages: $e'));
    }
  }

  @override
  Future<Result<ChatMessage, Failure>> getLatestMessage(
    String consultationId,
  ) async {
    try {
      final response = await _chatApi.getLatestMessage(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse latest message: $e'),
      );
    }
  }
}
