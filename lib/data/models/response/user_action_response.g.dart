// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserActionResponseImpl _$$UserActionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserActionResponseImpl(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  name: json['name'] as String?,
);

Map<String, dynamic> _$$UserActionResponseImplToJson(
  _$UserActionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
};
