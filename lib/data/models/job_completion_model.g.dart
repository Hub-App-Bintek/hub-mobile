// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_completion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobCompletionModelImpl _$$JobCompletionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JobCompletionModelImpl(
      monitoringId: (json['monitoringId'] as num).toInt(),
      supervisorId: (json['supervisorId'] as num).toInt(),
      supervisorName: json['supervisorName'] as String,
      completionDocumentUrl: json['completionDocumentUrl'] as String?,
      completionNotes: json['completionNotes'] as String?,
      completionRequestedAt: json['completionRequestedAt'] == null
          ? null
          : DateTime.parse(json['completionRequestedAt'] as String),
      status: json['status'] as String,
      isApprovedByHomeowner: json['isApprovedByHomeowner'] as bool,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
    );

Map<String, dynamic> _$$JobCompletionModelImplToJson(
        _$JobCompletionModelImpl instance) =>
    <String, dynamic>{
      'monitoringId': instance.monitoringId,
      'supervisorId': instance.supervisorId,
      'supervisorName': instance.supervisorName,
      'completionDocumentUrl': instance.completionDocumentUrl,
      'completionNotes': instance.completionNotes,
      'completionRequestedAt':
          instance.completionRequestedAt?.toIso8601String(),
      'status': instance.status,
      'isApprovedByHomeowner': instance.isApprovedByHomeowner,
      'approvedAt': instance.approvedAt?.toIso8601String(),
    };
