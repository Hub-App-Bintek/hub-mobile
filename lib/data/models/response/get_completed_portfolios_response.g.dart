// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_completed_portfolios_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCompletedPortfoliosResponseImpl
_$$GetCompletedPortfoliosResponseImplFromJson(Map<String, dynamic> json) =>
    _$GetCompletedPortfoliosResponseImpl(
      portfolios: (json['portfolios'] as List<dynamic>)
          .map((e) => PortfolioData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetCompletedPortfoliosResponseImplToJson(
  _$GetCompletedPortfoliosResponseImpl instance,
) => <String, dynamic>{'portfolios': instance.portfolios};

_$PortfolioDataImpl _$$PortfolioDataImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioDataImpl(
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

Map<String, dynamic> _$$PortfolioDataImplToJson(_$PortfolioDataImpl instance) =>
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
