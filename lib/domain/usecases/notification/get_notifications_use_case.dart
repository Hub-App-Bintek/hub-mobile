import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/query_params.dart';
import 'package:pkp_hub/core/usecases/use_case_query_params.dart';
import 'package:pkp_hub/data/models/response/notification_page_response.dart';
import 'package:pkp_hub/domain/repositories/notification_repository.dart';

class GetNotificationsQuery extends QueryParams {
  GetNotificationsQuery({
    this.page = 0,
    this.size = 20,
    this.unreadOnly = false,
  });

  final int page;
  final int size;
  final bool unreadOnly;

  @override
  Map<String, dynamic> toMap() => {
    'page': page,
    'size': size,
    'unreadOnly': unreadOnly,
  };

  @override
  Map<String, String> toQuery() => {
    'page': page.toString(),
    'size': size.toString(),
    'unreadOnly': unreadOnly.toString(),
  };
}

class GetNotificationsUseCase
    implements
        UseCaseQueryParams<NotificationPageResponse, GetNotificationsQuery> {
  GetNotificationsUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  Future<Result<NotificationPageResponse, Failure>> call(
    GetNotificationsQuery queryParams,
  ) {
    return _repository.getNotifications(
      page: queryParams.page,
      size: queryParams.size,
      unreadOnly: queryParams.unreadOnly,
    );
  }
}
