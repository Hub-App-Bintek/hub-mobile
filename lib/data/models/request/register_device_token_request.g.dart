// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterDeviceTokenRequestImpl _$$RegisterDeviceTokenRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterDeviceTokenRequestImpl(
  deviceToken: json['deviceToken'] as String,
  deviceType: json['deviceType'] as String,
  deviceModel: json['deviceModel'] as String,
  appVersion: json['appVersion'] as String,
);

Map<String, dynamic> _$$RegisterDeviceTokenRequestImplToJson(
  _$RegisterDeviceTokenRequestImpl instance,
) => <String, dynamic>{
  'deviceToken': instance.deviceToken,
  'deviceType': instance.deviceType,
  'deviceModel': instance.deviceModel,
  'appVersion': instance.appVersion,
};
