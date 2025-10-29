// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  userId: (json['userId'] as num?)?.toInt(),
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  token: json['token'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'token': instance.token,
      'role': instance.role,
      'status': instance.status,
      'expiresIn': instance.expiresIn,
    };
