// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationImpl _$$ConsultationImplFromJson(Map<String, dynamic> json) =>
    _$ConsultationImpl(
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
      homeOwnerName: json['homeOwnerName'] as String?,
      consultantId: (json['consultantId'] as num?)?.toInt(),
      consultantName: json['consultantName'] as String?,
      city: json['city'] as String?,
      status: json['status'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$ConsultationImplToJson(_$ConsultationImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'homeOwnerId': instance.homeOwnerId,
      'homeOwnerName': instance.homeOwnerName,
      'consultantId': instance.consultantId,
      'consultantName': instance.consultantName,
      'city': instance.city,
      'status': instance.status,
      'state': instance.state,
    };
