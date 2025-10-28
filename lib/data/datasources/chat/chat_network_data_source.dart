import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
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
  ChatNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<ChatMessage, Failure>> sendMessage(
    String consultationId,
    SendChatMessageRequest request,
  ) async {
    try {
      final res = await _apiClient.dio.post(
        ApiEndpoints.chatMessages.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: request.toJson(),
      );
      return Success(ChatMessage.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.get(
        ApiEndpoints.chatMessages.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
      final data = res.data as List<dynamic>;
      return Success(
        data
            .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
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
      final res = await _apiClient.dio.get(
        ApiEndpoints.chatLatest.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
      return Success(ChatMessage.fromJson(res.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse latest message: $e'),
      );
    }
  }
}
