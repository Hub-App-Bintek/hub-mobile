// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantImpl _$$ConsultantImplFromJson(Map<String, dynamic> json) =>
    _$ConsultantImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      specialization: json['specialization'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ConsultantImplToJson(_$ConsultantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatarUrl': instance.avatarUrl,
      'specialization': instance.specialization,
      'rating': instance.rating,
    };
