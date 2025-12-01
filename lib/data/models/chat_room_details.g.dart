// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomDetailsDataImpl _$$ChatRoomDetailsDataImplFromJson(
  Map<String, dynamic> json,
) => _$ChatRoomDetailsDataImpl(
  roomId: json['roomId'] as String?,
  chatDetails: json['chatDetails'] == null
      ? null
      : ChatDetails.fromJson(json['chatDetails'] as Map<String, dynamic>),
  messages: (json['messages'] as List<dynamic>?)
      ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ChatRoomDetailsDataImplToJson(
  _$ChatRoomDetailsDataImpl instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'chatDetails': instance.chatDetails,
  'messages': instance.messages,
  'pagination': instance.pagination,
};
