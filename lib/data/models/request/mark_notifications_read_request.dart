import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_notifications_read_request.freezed.dart';
part 'mark_notifications_read_request.g.dart';

@freezed
class MarkNotificationsReadRequest with _$MarkNotificationsReadRequest {
  const factory MarkNotificationsReadRequest({List<String>? notificationIds}) =
      _MarkNotificationsReadRequest;

  factory MarkNotificationsReadRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationsReadRequestFromJson(json);
}
