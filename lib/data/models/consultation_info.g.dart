// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationInfoImpl _$$ConsultationInfoImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationInfoImpl(
  homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
  homeOwnerName: json['homeOwnerName'] as String?,
  consultantId: (json['consultantId'] as num?)?.toInt(),
  consultantName: json['consultantName'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$ConsultationInfoImplToJson(
  _$ConsultationInfoImpl instance,
) => <String, dynamic>{
  'homeOwnerId': instance.homeOwnerId,
  'homeOwnerName': instance.homeOwnerName,
  'consultantId': instance.consultantId,
  'consultantName': instance.consultantName,
  'status': instance.status,
};
