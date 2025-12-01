// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChatRoomResponseImpl _$$CreateChatRoomResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateChatRoomResponseImpl(
  id: json['id'] as String?,
  name: json['name'] as String?,
  type: json['type'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  isActive: json['isActive'] as bool?,
  participants: (json['participants'] as List<dynamic>?)
      ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateChatRoomResponseImplToJson(
  _$CreateChatRoomResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'isActive': instance.isActive,
  'participants': instance.participants,
};
