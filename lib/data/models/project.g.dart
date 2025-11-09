// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      projectId: json['projectId'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      location: json['location'] == null
          ? null
          : ProjectLocation.fromJson(json['location'] as Map<String, dynamic>),
      landArea: (json['landArea'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      homeOwnerId: (json['homeOwnerId'] as num?)?.toInt(),
      homeOwnerName: json['homeOwnerName'] as String?,
      consultantId: (json['consultantId'] as num?)?.toInt(),
      consultantName: json['consultantName'] as String?,
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'location': instance.location,
      'landArea': instance.landArea,
      'createdAt': instance.createdAt?.toIso8601String(),
      'homeOwnerId': instance.homeOwnerId,
      'homeOwnerName': instance.homeOwnerName,
      'consultantId': instance.consultantId,
      'consultantName': instance.consultantName,
    };
