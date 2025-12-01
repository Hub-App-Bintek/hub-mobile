// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatDetailsImpl _$$ChatDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ChatDetailsImpl(
      roomId: json['roomId'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatDetailsImplToJson(_$ChatDetailsImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'participants': instance.participants,
    };
