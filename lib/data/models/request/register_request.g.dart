// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  title: json['title'] as String,
  fullName: json['fullName'] as String,
  phone: json['phone'] as String,
  idType: json['idType'] as String,
  idNumber: json['idNumber'] as String,
  provinceId: (json['provinceId'] as num).toInt(),
  cityId: (json['cityId'] as num).toInt(),
  districtId: (json['districtId'] as num).toInt(),
  subdistrictId: (json['subdistrictId'] as num).toInt(),
  address: json['address'] as String,
  idPhotoPath: json['idPhotoPath'] as String,
  selfiePhotoPath: json['selfiePhotoPath'] as String,
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'title': instance.title,
  'fullName': instance.fullName,
  'phone': instance.phone,
  'idType': instance.idType,
  'idNumber': instance.idNumber,
  'provinceId': instance.provinceId,
  'cityId': instance.cityId,
  'districtId': instance.districtId,
  'subdistrictId': instance.subdistrictId,
  'address': instance.address,
  'idPhotoPath': instance.idPhotoPath,
  'selfiePhotoPath': instance.selfiePhotoPath,
};
