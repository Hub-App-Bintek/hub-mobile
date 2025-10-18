// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_portfolio_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavePortfolioRequestImpl _$$SavePortfolioRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SavePortfolioRequestImpl(
      bio: json['bio'] as String?,
      specialization: json['specialization'] as String?,
      experience: json['experience'] as String?,
      education: json['education'] as String?,
      certifications: json['certifications'] as String?,
      projectSamples: json['projectSamples'] as String?,
      linkedinUrl: json['linkedinUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
    );

Map<String, dynamic> _$$SavePortfolioRequestImplToJson(
        _$SavePortfolioRequestImpl instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'specialization': instance.specialization,
      'experience': instance.experience,
      'education': instance.education,
      'certifications': instance.certifications,
      'projectSamples': instance.projectSamples,
      'linkedinUrl': instance.linkedinUrl,
      'websiteUrl': instance.websiteUrl,
    };
