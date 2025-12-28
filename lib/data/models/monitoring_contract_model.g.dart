// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringContractModelImpl _$$MonitoringContractModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringContractModelImpl(
      id: (json['id'] as num).toInt(),
      monitoringId: (json['monitoringId'] as num).toInt(),
      supervisorId: (json['supervisorId'] as num).toInt(),
      supervisorName: json['supervisorName'] as String,
      documentUrl: json['documentUrl'] as String,
      status: json['status'] as String,
      revisionCount: (json['revisionCount'] as num).toInt(),
      homeownerSignedAt: json['homeownerSignedAt'] == null
          ? null
          : DateTime.parse(json['homeownerSignedAt'] as String),
      supervisorSignedAt: json['supervisorSignedAt'] == null
          ? null
          : DateTime.parse(json['supervisorSignedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MonitoringContractModelImplToJson(
        _$MonitoringContractModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'monitoringId': instance.monitoringId,
      'supervisorId': instance.supervisorId,
      'supervisorName': instance.supervisorName,
      'documentUrl': instance.documentUrl,
      'status': instance.status,
      'revisionCount': instance.revisionCount,
      'homeownerSignedAt': instance.homeownerSignedAt?.toIso8601String(),
      'supervisorSignedAt': instance.supervisorSignedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
