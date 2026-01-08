// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringDetailModelImpl _$$MonitoringDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringDetailModelImpl(
      id: (json['id'] as num).toInt(),
      homeownerId: (json['homeownerId'] as num).toInt(),
      homeownerName: json['homeownerName'] as String?,
      homeownerEmail: json['homeownerEmail'] as String?,
      supervisorId: (json['supervisorId'] as num?)?.toInt(),
      supervisorName: json['supervisorName'] as String?,
      supervisorEmail: json['supervisorEmail'] as String?,
      projectId: json['projectId'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      completionDocumentUrl: json['completionDocumentUrl'] as String?,
      completionNotes: json['completionNotes'] as String?,
      completionRequestedAt: json['completionRequestedAt'] == null
          ? null
          : DateTime.parse(json['completionRequestedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      totalReports: (json['totalReports'] as num).toInt(),
      totalFindings: (json['totalFindings'] as num).toInt(),
      totalDocuments: (json['totalDocuments'] as num).toInt(),
      totalContracts: (json['totalContracts'] as num).toInt(),
      activeContract: json['activeContract'] == null
          ? null
          : MonitoringContractModel.fromJson(
              json['activeContract'] as Map<String, dynamic>),
      latestReport: json['latestReport'] == null
          ? null
          : ReportDetailModel.fromJson(
              json['latestReport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MonitoringDetailModelImplToJson(
        _$MonitoringDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeownerId': instance.homeownerId,
      'homeownerName': instance.homeownerName,
      'homeownerEmail': instance.homeownerEmail,
      'supervisorId': instance.supervisorId,
      'supervisorName': instance.supervisorName,
      'supervisorEmail': instance.supervisorEmail,
      'projectId': instance.projectId,
      'type': instance.type,
      'status': instance.status,
      'completionDocumentUrl': instance.completionDocumentUrl,
      'completionNotes': instance.completionNotes,
      'completionRequestedAt':
          instance.completionRequestedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'totalReports': instance.totalReports,
      'totalFindings': instance.totalFindings,
      'totalDocuments': instance.totalDocuments,
      'totalContracts': instance.totalContracts,
      'activeContract': instance.activeContract,
      'latestReport': instance.latestReport,
    };
