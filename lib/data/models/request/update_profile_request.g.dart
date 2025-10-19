// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateProfileRequestImpl _$$UpdateProfileRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateProfileRequestImpl(
  name: json['name'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  ktpNumber: json['ktpNumber'] as String,
  ktpFilePath: json['ktpFilePath'] as String?,
  selfieFilePath: json['selfieFilePath'] as String?,
);

Map<String, dynamic> _$$UpdateProfileRequestImplToJson(
  _$UpdateProfileRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'ktpNumber': instance.ktpNumber,
  'ktpFilePath': instance.ktpFilePath,
  'selfieFilePath': instance.selfieFilePath,
};
