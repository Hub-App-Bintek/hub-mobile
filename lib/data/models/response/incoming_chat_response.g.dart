// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomingChatResponseImpl _$$IncomingChatResponseImplFromJson(
  Map<String, dynamic> json,
) => _$IncomingChatResponseImpl(
  success: json['success'] as bool?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ChatData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChatData>[],
  metadata: json['metadata'] == null
      ? null
      : Pagination.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$IncomingChatResponseImplToJson(
  _$IncomingChatResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'metadata': instance.metadata,
};
