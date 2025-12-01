import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class CreateDirectChatRoomUseCase extends UseCase<CreateChatRoomResponse, int> {
  CreateDirectChatRoomUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<CreateChatRoomResponse, Failure>> call(int targetUserId) {
    return _repository.createDirectRoom(targetUserId);
  }
}
