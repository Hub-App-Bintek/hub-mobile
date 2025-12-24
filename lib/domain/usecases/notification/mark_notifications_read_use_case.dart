import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/mark_notifications_read_request.dart';
import 'package:pkp_hub/data/models/response/unread_count_response.dart';
import 'package:pkp_hub/domain/repositories/notification_repository.dart';

class MarkNotificationsReadUseCase
    implements UseCase<UnreadCountResponse, MarkNotificationsReadRequest> {
  MarkNotificationsReadUseCase(this._repository);

  final NotificationRepository _repository;

  @override
  Future<Result<UnreadCountResponse, Failure>> call(
    MarkNotificationsReadRequest payload,
  ) {
    return _repository.markAsRead(payload);
  }
}
