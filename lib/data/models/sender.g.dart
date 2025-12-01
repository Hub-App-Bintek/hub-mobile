// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SenderImpl _$$SenderImplFromJson(Map<String, dynamic> json) => _$SenderImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$$SenderImplToJson(_$SenderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
    };
