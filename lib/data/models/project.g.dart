// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      city: json['city'] as String?,
      projectStatus: json['projectStatus'] as String?,
      state: json['state'] as String?,
      stateDescription: json['stateDescription'] as String?,
      consultationInfo: json['consultationInfo'] == null
          ? null
          : ConsultationInfo.fromJson(
              json['consultationInfo'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'city': instance.city,
      'projectStatus': instance.projectStatus,
      'state': instance.state,
      'stateDescription': instance.stateDescription,
      'consultationInfo': instance.consultationInfo,
    };
