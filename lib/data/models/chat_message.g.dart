// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String?,
      chatRoomId: json['chatRoomId'] as String?,
      senderId: (json['senderId'] as num?)?.toInt(),
      receiverId: (json['receiverId'] as num?)?.toInt(),
      messageType: json['messageType'] as String?,
      messageContent: json['messageContent'] as String?,
      fileUrl: json['fileUrl'] as String?,
      isRead: json['isRead'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatRoomId': instance.chatRoomId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'messageType': instance.messageType,
      'messageContent': instance.messageContent,
      'fileUrl': instance.fileUrl,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
