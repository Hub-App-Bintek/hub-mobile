// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_send_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSendMessageResponseImpl _$$ChatSendMessageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatSendMessageResponseImpl(
  messageId: _readMessageId(json, 'messageId') as String?,
  timestamp: json['timestamp'] as String?,
);

Map<String, dynamic> _$$ChatSendMessageResponseImplToJson(
  _$ChatSendMessageResponseImpl instance,
) => <String, dynamic>{
  'messageId': instance.messageId,
  'timestamp': instance.timestamp,
};
