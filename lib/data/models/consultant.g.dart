// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantImpl _$$ConsultantImplFromJson(Map<String, dynamic> json) =>
    _$ConsultantImpl(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      specialty: json['specialty'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      avatarUrl: json['avatarUrl'] as String?,
      location: json['location'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
      experienceLevel: json['experienceLevel'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      contactInfo: json['contactInfo'] as String?,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble(),
      packageCost: (json['packageCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ConsultantImplToJson(_$ConsultantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'specialty': instance.specialty,
      'rating': instance.rating,
      'distanceKm': instance.distanceKm,
      'avatarUrl': instance.avatarUrl,
      'location': instance.location,
      'address': instance.address,
      'type': instance.type,
      'experienceLevel': instance.experienceLevel,
      'availabilityStatus': instance.availabilityStatus,
      'contactInfo': instance.contactInfo,
      'hourlyRate': instance.hourlyRate,
      'packageCost': instance.packageCost,
    };
