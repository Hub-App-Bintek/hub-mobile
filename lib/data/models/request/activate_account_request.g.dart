// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivateAccountRequestImpl _$$ActivateAccountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivateAccountRequestImpl(
      email: json['email'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$$ActivateAccountRequestImplToJson(
        _$ActivateAccountRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
