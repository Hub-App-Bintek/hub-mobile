import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_send_message_request.freezed.dart';
part 'chat_send_message_request.g.dart';

@freezed
class ChatSendMessageRequest with _$ChatSendMessageRequest {
  const factory ChatSendMessageRequest({
    required String content,
    @Default('text') String type,
  }) = _ChatSendMessageRequest;

  factory ChatSendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatSendMessageRequestFromJson(json);
}
