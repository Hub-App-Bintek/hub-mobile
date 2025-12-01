// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomDetailsResponseImpl _$$ChatRoomDetailsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatRoomDetailsResponseImpl(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : ChatRoomDetailsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ChatRoomDetailsResponseImplToJson(
  _$ChatRoomDetailsResponseImpl instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
