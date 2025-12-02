// lib/data/models/response/permit_status_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit_status_response.freezed.dart';

part 'permit_status_response.g.dart';

// The main wrapper class for the entire response
@freezed
class PermitStatusResponse with _$PermitStatusResponse {
  const factory PermitStatusResponse({
    required PermitDetails permit,
    required StatusDetails status,
  }) = _PermitStatusResponse;

  factory PermitStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PermitStatusResponseFromJson(json);
}

// The 'permit' object
@freezed
class PermitDetails with _$PermitDetails {
  const factory PermitDetails({
    required String id,
    required String projectId,
    String? simbgId,
    required String permitType,
    required String status,
    DateTime? submittedAt,
    DateTime? approvedAt,
    String? dedDocumentUrl,
    String? pbgDocumentUrl,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PermitDetails;

  factory PermitDetails.fromJson(Map<String, dynamic> json) =>
      _$PermitDetailsFromJson(json);
}

// The 'status' object
@freezed
class StatusDetails with _$StatusDetails {
  const factory StatusDetails({
    String? simbgId,
    String? externalReference,
    required String status,
    @Default([]) List<StatusHistoryItem> history,
    AssignedOffice? assignedOffice,
  }) = _StatusDetails;

  factory StatusDetails.fromJson(Map<String, dynamic> json) =>
      _$StatusDetailsFromJson(json);
}

// An item in the 'history' array
@freezed
class StatusHistoryItem with _$StatusHistoryItem {
  const factory StatusHistoryItem({
    required String status,
    required DateTime at,
    required String by,
  }) = _StatusHistoryItem;

  factory StatusHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryItemFromJson(json);
}

// The 'assignedOffice' object
@freezed
class AssignedOffice with _$AssignedOffice {
  const factory AssignedOffice({String? regionCode, String? officeName}) =
      _AssignedOffice;

  factory AssignedOffice.fromJson(Map<String, dynamic> json) =>
      _$AssignedOfficeFromJson(json);
}
