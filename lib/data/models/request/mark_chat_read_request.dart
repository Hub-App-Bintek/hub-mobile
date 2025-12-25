import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_chat_read_request.freezed.dart';
part 'mark_chat_read_request.g.dart';

@freezed
class MarkChatReadRequest with _$MarkChatReadRequest {
  const factory MarkChatReadRequest({required bool isRead}) =
      _MarkChatReadRequest;

  factory MarkChatReadRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkChatReadRequestFromJson(json);
}
