// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitStatusResponseImpl _$$PermitStatusResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PermitStatusResponseImpl(
  permit: PermitDetails.fromJson(json['permit'] as Map<String, dynamic>),
  status: StatusDetails.fromJson(json['status'] as Map<String, dynamic>),
  submissions:
      (json['submissions'] as List<dynamic>?)
          ?.map((e) => SubmissionItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PermitStatusResponseImplToJson(
  _$PermitStatusResponseImpl instance,
) => <String, dynamic>{
  'permit': instance.permit,
  'status': instance.status,
  'submissions': instance.submissions,
};

_$SubmissionItemImpl _$$SubmissionItemImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionItemImpl(
      id: json['id'] as String,
      permitId: json['permitId'] as String,
      permissionData: json['permissionData'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SubmissionItemImplToJson(
  _$SubmissionItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'permitId': instance.permitId,
  'permissionData': instance.permissionData,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_$PermitDetailsImpl _$$PermitDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PermitDetailsImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      simbgId: json['simbgId'] as String?,
      permitType: json['permitType'] as String,
      status: json['status'] as String,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      dedDocumentUrl: json['dedDocumentUrl'] as String?,
      pbgDocumentUrl: json['pbgDocumentUrl'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PermitDetailsImplToJson(_$PermitDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'simbgId': instance.simbgId,
      'permitType': instance.permitType,
      'status': instance.status,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'dedDocumentUrl': instance.dedDocumentUrl,
      'pbgDocumentUrl': instance.pbgDocumentUrl,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$StatusDetailsImpl _$$StatusDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$StatusDetailsImpl(
  simbgId: json['simbgId'] as String?,
  externalReference: json['externalReference'] as String?,
  status: json['status'] as String,
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => StatusHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  assignedOffice: json['assignedOffice'] == null
      ? null
      : AssignedOffice.fromJson(json['assignedOffice'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$StatusDetailsImplToJson(_$StatusDetailsImpl instance) =>
    <String, dynamic>{
      'simbgId': instance.simbgId,
      'externalReference': instance.externalReference,
      'status': instance.status,
      'history': instance.history,
      'assignedOffice': instance.assignedOffice,
    };

_$StatusHistoryItemImpl _$$StatusHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$StatusHistoryItemImpl(
  status: json['status'] as String,
  at: DateTime.parse(json['at'] as String),
  by: json['by'] as String,
);

Map<String, dynamic> _$$StatusHistoryItemImplToJson(
  _$StatusHistoryItemImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'at': instance.at.toIso8601String(),
  'by': instance.by,
};

_$AssignedOfficeImpl _$$AssignedOfficeImplFromJson(Map<String, dynamic> json) =>
    _$AssignedOfficeImpl(
      regionCode: json['regionCode'] as String?,
      officeName: json['officeName'] as String?,
    );

Map<String, dynamic> _$$AssignedOfficeImplToJson(
  _$AssignedOfficeImpl instance,
) => <String, dynamic>{
  'regionCode': instance.regionCode,
  'officeName': instance.officeName,
};
