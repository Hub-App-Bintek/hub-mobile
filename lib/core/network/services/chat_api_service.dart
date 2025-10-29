import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/chat_message.dart';
import 'package:pkp_hub/data/models/request/send_chat_message_request.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api_service.g.dart';

@RestApi()
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String? baseUrl}) = _ChatApiService;

  @POST(ApiEndpoints.chatMessages)
  Future<ChatMessage> sendMessage(
    @Path('consultationId') String consultationId,
    @Body() SendChatMessageRequest body,
  );

  @GET(ApiEndpoints.chatMessages)
  Future<List<ChatMessage>> getMessages(
    @Path('consultationId') String consultationId,
  );

  @GET(ApiEndpoints.chatLatest)
  Future<ChatMessage> getLatestMessage(
    @Path('consultationId') String consultationId,
  );
}
