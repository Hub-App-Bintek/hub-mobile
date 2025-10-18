// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPortfolioResponseImpl _$$GetPortfolioResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPortfolioResponseImpl(
      id: (json['id'] as num).toInt(),
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      specialization: json['specialization'] as String?,
      experience: json['experience'] as String?,
      education: json['education'] as String?,
      certifications: json['certifications'] as String?,
      projectSamples: json['projectSamples'] as String?,
      linkedinUrl: json['linkedinUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
    );

Map<String, dynamic> _$$GetPortfolioResponseImplToJson(
        _$GetPortfolioResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'bio': instance.bio,
      'specialization': instance.specialization,
      'experience': instance.experience,
      'education': instance.education,
      'certifications': instance.certifications,
      'projectSamples': instance.projectSamples,
      'linkedinUrl': instance.linkedinUrl,
      'websiteUrl': instance.websiteUrl,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };
