import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/incoming_chat_response.dart';
import 'package:pkp_hub/data/models/request/chat_send_message_request.dart';
import 'package:pkp_hub/data/models/response/chat_room_details_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/chat_send_message_response.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api_service.g.dart';

@RestApi()
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String? baseUrl}) = _ChatApiService;

  @POST(ApiEndpoints.chatDirectRoom)
  Future<CreateChatRoomResponse> createDirectRoom(
    @Path('targetUserId') int targetUserId,
  );

  @GET(ApiEndpoints.chatRoomDetail)
  Future<ChatRoomDetailsResponse> getRoomDetail(
    @Path('roomId') String roomId,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @POST(ApiEndpoints.chatRoomMessages)
  Future<ChatSendMessageResponse> sendRoomMessage(
    @Path('roomId') String roomId,
    @Body() ChatSendMessageRequest body,
  );

  @GET(ApiEndpoints.chatIncoming)
  Future<IncomingChatResponse> getIncomingChats({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('status') String? status,
    @Query('date_range') String? dateRange,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });
}
