import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/chat_send_message_request.dart';
import 'package:pkp_hub/data/models/response/chat_send_message_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class SendChatRoomMessageParams {
  SendChatRoomMessageParams({required this.roomId, required this.request});

  final String roomId;
  final ChatSendMessageRequest request;
}

class SendChatRoomMessageUseCase
    extends UseCase<ChatSendMessageResponse, SendChatRoomMessageParams> {
  SendChatRoomMessageUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<ChatSendMessageResponse, Failure>> call(
    SendChatRoomMessageParams params,
  ) {
    return _repository.sendRoomMessage(params.roomId, params.request);
  }
}
