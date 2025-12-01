// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatDataImpl _$$ChatDataImplFromJson(Map<String, dynamic> json) =>
    _$ChatDataImpl(
      roomId: json['roomId'] as String?,
      sender: json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
      messagePreview: json['messagePreview'] as String?,
      timestamp: json['timestamp'] as String?,
      read: json['read'] as bool?,
      priority: json['priority'] as String?,
      chatType: json['chatType'] as String?,
    );

Map<String, dynamic> _$$ChatDataImplToJson(_$ChatDataImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'sender': instance.sender,
      'messagePreview': instance.messagePreview,
      'timestamp': instance.timestamp,
      'read': instance.read,
      'priority': instance.priority,
      'chatType': instance.chatType,
    };
