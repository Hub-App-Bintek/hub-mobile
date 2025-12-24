// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordVerificationResponseImpl
_$$ForgotPasswordVerificationResponseImplFromJson(Map<String, dynamic> json) =>
    _$ForgotPasswordVerificationResponseImpl(
      resetToken: json['resetToken'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ForgotPasswordVerificationResponseImplToJson(
  _$ForgotPasswordVerificationResponseImpl instance,
) => <String, dynamic>{
  'resetToken': instance.resetToken,
  'expiresIn': instance.expiresIn,
};
