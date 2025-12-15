// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorResponseImpl _$$ApiErrorResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ApiErrorResponseImpl(
  errorCode: json['errorCode'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$ApiErrorResponseImplToJson(
  _$ApiErrorResponseImpl instance,
) => <String, dynamic>{
  'errorCode': instance.errorCode,
  'message': instance.message,
};
