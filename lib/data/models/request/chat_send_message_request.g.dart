// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSendMessageRequestImpl _$$ChatSendMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChatSendMessageRequestImpl(
  content: json['content'] as String,
  type: json['type'] as String? ?? 'text',
);

Map<String, dynamic> _$$ChatSendMessageRequestImplToJson(
  _$ChatSendMessageRequestImpl instance,
) => <String, dynamic>{'content': instance.content, 'type': instance.type};
