import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case_no_params.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class GetUnreadChatCountUseCase
    implements UseCaseNoPayload<UnreadCountResponse> {
  GetUnreadChatCountUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<UnreadCountResponse, Failure>> call() {
    return _repository.getUnreadCount();
  }
}
