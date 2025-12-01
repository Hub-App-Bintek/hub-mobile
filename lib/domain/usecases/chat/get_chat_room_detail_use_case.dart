import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/chat_room_details_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class ChatRoomDetailParams {
  ChatRoomDetailParams({required this.roomId, this.page = 1, this.limit = 50});

  final String roomId;
  final int page;
  final int limit;
}

class GetChatRoomDetailUseCase
    extends UseCase<ChatRoomDetailsResponse, ChatRoomDetailParams> {
  GetChatRoomDetailUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<ChatRoomDetailsResponse, Failure>> call(
    ChatRoomDetailParams params,
  ) {
    return _repository.getRoomDetail(
      params.roomId,
      page: params.page,
      limit: params.limit,
    );
  }
}
