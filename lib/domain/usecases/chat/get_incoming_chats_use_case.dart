import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/response/incoming_chat_response.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';

class GetIncomingChatsParams {
  GetIncomingChatsParams({
    this.page = 1,
    this.limit = 10,
    this.status,
    this.dateRange,
    this.sortBy,
    this.sortOrder,
  });

  final int page;
  final int limit;
  final String? status;
  final String? dateRange;
  final String? sortBy;
  final String? sortOrder;
}

class GetIncomingChatsUseCase
    extends UseCase<IncomingChatResponse, GetIncomingChatsParams> {
  GetIncomingChatsUseCase(this._repository);

  final ChatRepository _repository;

  @override
  Future<Result<IncomingChatResponse, Failure>> call(
    GetIncomingChatsParams params,
  ) {
    return _repository.getIncomingChats(
      page: params.page,
      limit: params.limit,
      status: params.status,
      dateRange: params.dateRange,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}
