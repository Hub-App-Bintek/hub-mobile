// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseImpl(
      userId: (json['userId'] as num).toInt(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String,
      status: json['status'] as String,
      ktpUrl: json['ktpUrl'] as String?,
      selfieUrl: json['selfieUrl'] as String?,
    );

Map<String, dynamic> _$$RegisterResponseImplToJson(
        _$RegisterResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'role': instance.role,
      'status': instance.status,
      'ktpUrl': instance.ktpUrl,
      'selfieUrl': instance.selfieUrl,
    };
