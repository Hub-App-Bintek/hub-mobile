import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/mark_chat_read_request.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class MarkChatReadUseCase
    implements UseCase<UnreadCountResponse, MarkChatReadParams> {
  MarkChatReadUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<UnreadCountResponse, Failure>> call(MarkChatReadParams params) {
    return _repository.markRoomRead(
      params.roomId,
      MarkChatReadRequest(isRead: params.isRead),
    );
  }
}

class MarkChatReadParams {
  const MarkChatReadParams({required this.roomId, this.isRead = true});

  final String roomId;
  final bool isRead;
}
