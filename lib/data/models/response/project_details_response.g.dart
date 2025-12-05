// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDetailsResponseImpl _$$ProjectDetailsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectDetailsResponseImpl(
  projectId: json['projectId'] as String?,
  projectName: json['projectName'] as String?,
  projectType: json['projectType'] as String?,
  projectStatus: json['projectStatus'] as String?,
  projectState: json['projectState'] as String?,
  projectStateDescription: json['projectStateDescription'] as String?,
  projectLocation: json['projectLocation'] == null
      ? null
      : ProjectLocation.fromJson(
          json['projectLocation'] as Map<String, dynamic>,
        ),
  landArea: (json['landArea'] as num?)?.toDouble(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  consultationInfo: json['consultationInfo'] == null
      ? null
      : ConsultationInfo.fromJson(
          json['consultationInfo'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$ProjectDetailsResponseImplToJson(
  _$ProjectDetailsResponseImpl instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'projectType': instance.projectType,
  'projectStatus': instance.projectStatus,
  'projectState': instance.projectState,
  'projectStateDescription': instance.projectStateDescription,
  'projectLocation': instance.projectLocation,
  'landArea': instance.landArea,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'consultationInfo': instance.consultationInfo,
};
