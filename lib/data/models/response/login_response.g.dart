// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      userId: (json['userId'] as num).toInt(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      token: json['token'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'token': instance.token,
      'role': instance.role,
      'status': instance.status,
      'expiresIn': instance.expiresIn,
    };
