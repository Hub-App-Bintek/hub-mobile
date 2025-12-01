// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterResponseImpl(
  status: json['status'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : RegisterResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$RegisterResponseImplToJson(
  _$RegisterResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_$RegisterResponseDataImpl _$$RegisterResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterResponseDataImpl(
  userId: json['userId'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
);

Map<String, dynamic> _$$RegisterResponseDataImplToJson(
  _$RegisterResponseDataImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'verificationStatus': instance.verificationStatus,
};
