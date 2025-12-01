import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_send_message_response.freezed.dart';
part 'chat_send_message_response.g.dart';

@freezed
class ChatSendMessageResponse with _$ChatSendMessageResponse {
  const factory ChatSendMessageResponse({
    @JsonKey(readValue: _readMessageId) String? messageId,
    String? timestamp,
  }) = _ChatSendMessageResponse;

  factory ChatSendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatSendMessageResponseFromJson(json);

  factory ChatSendMessageResponse.fromResponse(dynamic json) {
    final map = json is Map<String, dynamic>
        ? json.map((k, v) => MapEntry(k.toString(), v))
        : <String, dynamic>{};
    final data = map['data'];
    if (data is Map<String, dynamic>) {
      return ChatSendMessageResponse.fromJson(
        data.map((k, v) => MapEntry(k.toString(), v)),
      );
    }
    return ChatSendMessageResponse.fromJson(map);
  }
}

Object? _readMessageId(Map json, String key) {
  final map = json.map((k, v) => MapEntry(k.toString(), v));
  return (map['message_id'] ?? map['messageId'])?.toString();
}
