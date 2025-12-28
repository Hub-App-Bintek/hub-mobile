// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringDetailModel _$MonitoringDetailModelFromJson(
    Map<String, dynamic> json) {
  return _MonitoringDetailModel.fromJson(json);
}

/// @nodoc
mixin _$MonitoringDetailModel {
  int get id => throw _privateConstructorUsedError;
  int get homeownerId => throw _privateConstructorUsedError;
  String get homeownerName => throw _privateConstructorUsedError;
  String get homeownerEmail => throw _privateConstructorUsedError;
  int? get supervisorId => throw _privateConstructorUsedError;
  String? get supervisorName => throw _privateConstructorUsedError;
  String? get supervisorEmail => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get completionDocumentUrl => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;
  DateTime? get completionRequestedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get totalReports => throw _privateConstructorUsedError;
  int get totalFindings => throw _privateConstructorUsedError;
  int get totalDocuments => throw _privateConstructorUsedError;
  int get totalContracts => throw _privateConstructorUsedError;
  MonitoringContractModel? get activeContract =>
      throw _privateConstructorUsedError;
  ReportDetailModel? get latestReport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringDetailModelCopyWith<MonitoringDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringDetailModelCopyWith<$Res> {
  factory $MonitoringDetailModelCopyWith(MonitoringDetailModel value,
          $Res Function(MonitoringDetailModel) then) =
      _$MonitoringDetailModelCopyWithImpl<$Res, MonitoringDetailModel>;
  @useResult
  $Res call(
      {int id,
      int homeownerId,
      String homeownerName,
      String homeownerEmail,
      int? supervisorId,
      String? supervisorName,
      String? supervisorEmail,
      String projectId,
      String type,
      String status,
      String? completionDocumentUrl,
      String? completionNotes,
      DateTime? completionRequestedAt,
      DateTime createdAt,
      DateTime updatedAt,
      int totalReports,
      int totalFindings,
      int totalDocuments,
      int totalContracts,
      MonitoringContractModel? activeContract,
      ReportDetailModel? latestReport});

  $MonitoringContractModelCopyWith<$Res>? get activeContract;
  $ReportDetailModelCopyWith<$Res>? get latestReport;
}

/// @nodoc
class _$MonitoringDetailModelCopyWithImpl<$Res,
        $Val extends MonitoringDetailModel>
    implements $MonitoringDetailModelCopyWith<$Res> {
  _$MonitoringDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeownerId = null,
    Object? homeownerName = null,
    Object? homeownerEmail = null,
    Object? supervisorId = freezed,
    Object? supervisorName = freezed,
    Object? supervisorEmail = freezed,
    Object? projectId = null,
    Object? type = null,
    Object? status = null,
    Object? completionDocumentUrl = freezed,
    Object? completionNotes = freezed,
    Object? completionRequestedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? totalReports = null,
    Object? totalFindings = null,
    Object? totalDocuments = null,
    Object? totalContracts = null,
    Object? activeContract = freezed,
    Object? latestReport = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      homeownerId: null == homeownerId
          ? _value.homeownerId
          : homeownerId // ignore: cast_nullable_to_non_nullable
              as int,
      homeownerName: null == homeownerName
          ? _value.homeownerName
          : homeownerName // ignore: cast_nullable_to_non_nullable
              as String,
      homeownerEmail: null == homeownerEmail
          ? _value.homeownerEmail
          : homeownerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorEmail: freezed == supervisorEmail
          ? _value.supervisorEmail
          : supervisorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      completionDocumentUrl: freezed == completionDocumentUrl
          ? _value.completionDocumentUrl
          : completionDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRequestedAt: freezed == completionRequestedAt
          ? _value.completionRequestedAt
          : completionRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalReports: null == totalReports
          ? _value.totalReports
          : totalReports // ignore: cast_nullable_to_non_nullable
              as int,
      totalFindings: null == totalFindings
          ? _value.totalFindings
          : totalFindings // ignore: cast_nullable_to_non_nullable
              as int,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
      totalContracts: null == totalContracts
          ? _value.totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as int,
      activeContract: freezed == activeContract
          ? _value.activeContract
          : activeContract // ignore: cast_nullable_to_non_nullable
              as MonitoringContractModel?,
      latestReport: freezed == latestReport
          ? _value.latestReport
          : latestReport // ignore: cast_nullable_to_non_nullable
              as ReportDetailModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonitoringContractModelCopyWith<$Res>? get activeContract {
    if (_value.activeContract == null) {
      return null;
    }

    return $MonitoringContractModelCopyWith<$Res>(_value.activeContract!,
        (value) {
      return _then(_value.copyWith(activeContract: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportDetailModelCopyWith<$Res>? get latestReport {
    if (_value.latestReport == null) {
      return null;
    }

    return $ReportDetailModelCopyWith<$Res>(_value.latestReport!, (value) {
      return _then(_value.copyWith(latestReport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonitoringDetailModelImplCopyWith<$Res>
    implements $MonitoringDetailModelCopyWith<$Res> {
  factory _$$MonitoringDetailModelImplCopyWith(
          _$MonitoringDetailModelImpl value,
          $Res Function(_$MonitoringDetailModelImpl) then) =
      __$$MonitoringDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int homeownerId,
      String homeownerName,
      String homeownerEmail,
      int? supervisorId,
      String? supervisorName,
      String? supervisorEmail,
      String projectId,
      String type,
      String status,
      String? completionDocumentUrl,
      String? completionNotes,
      DateTime? completionRequestedAt,
      DateTime createdAt,
      DateTime updatedAt,
      int totalReports,
      int totalFindings,
      int totalDocuments,
      int totalContracts,
      MonitoringContractModel? activeContract,
      ReportDetailModel? latestReport});

  @override
  $MonitoringContractModelCopyWith<$Res>? get activeContract;
  @override
  $ReportDetailModelCopyWith<$Res>? get latestReport;
}

/// @nodoc
class __$$MonitoringDetailModelImplCopyWithImpl<$Res>
    extends _$MonitoringDetailModelCopyWithImpl<$Res,
        _$MonitoringDetailModelImpl>
    implements _$$MonitoringDetailModelImplCopyWith<$Res> {
  __$$MonitoringDetailModelImplCopyWithImpl(_$MonitoringDetailModelImpl _value,
      $Res Function(_$MonitoringDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeownerId = null,
    Object? homeownerName = null,
    Object? homeownerEmail = null,
    Object? supervisorId = freezed,
    Object? supervisorName = freezed,
    Object? supervisorEmail = freezed,
    Object? projectId = null,
    Object? type = null,
    Object? status = null,
    Object? completionDocumentUrl = freezed,
    Object? completionNotes = freezed,
    Object? completionRequestedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? totalReports = null,
    Object? totalFindings = null,
    Object? totalDocuments = null,
    Object? totalContracts = null,
    Object? activeContract = freezed,
    Object? latestReport = freezed,
  }) {
    return _then(_$MonitoringDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      homeownerId: null == homeownerId
          ? _value.homeownerId
          : homeownerId // ignore: cast_nullable_to_non_nullable
              as int,
      homeownerName: null == homeownerName
          ? _value.homeownerName
          : homeownerName // ignore: cast_nullable_to_non_nullable
              as String,
      homeownerEmail: null == homeownerEmail
          ? _value.homeownerEmail
          : homeownerEmail // ignore: cast_nullable_to_non_nullable
              as String,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorEmail: freezed == supervisorEmail
          ? _value.supervisorEmail
          : supervisorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      completionDocumentUrl: freezed == completionDocumentUrl
          ? _value.completionDocumentUrl
          : completionDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completionNotes: freezed == completionNotes
          ? _value.completionNotes
          : completionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRequestedAt: freezed == completionRequestedAt
          ? _value.completionRequestedAt
          : completionRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalReports: null == totalReports
          ? _value.totalReports
          : totalReports // ignore: cast_nullable_to_non_nullable
              as int,
      totalFindings: null == totalFindings
          ? _value.totalFindings
          : totalFindings // ignore: cast_nullable_to_non_nullable
              as int,
      totalDocuments: null == totalDocuments
          ? _value.totalDocuments
          : totalDocuments // ignore: cast_nullable_to_non_nullable
              as int,
      totalContracts: null == totalContracts
          ? _value.totalContracts
          : totalContracts // ignore: cast_nullable_to_non_nullable
              as int,
      activeContract: freezed == activeContract
          ? _value.activeContract
          : activeContract // ignore: cast_nullable_to_non_nullable
              as MonitoringContractModel?,
      latestReport: freezed == latestReport
          ? _value.latestReport
          : latestReport // ignore: cast_nullable_to_non_nullable
              as ReportDetailModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringDetailModelImpl implements _MonitoringDetailModel {
  const _$MonitoringDetailModelImpl(
      {required this.id,
      required this.homeownerId,
      required this.homeownerName,
      required this.homeownerEmail,
      this.supervisorId,
      this.supervisorName,
      this.supervisorEmail,
      required this.projectId,
      required this.type,
      required this.status,
      this.completionDocumentUrl,
      this.completionNotes,
      this.completionRequestedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.totalReports,
      required this.totalFindings,
      required this.totalDocuments,
      required this.totalContracts,
      this.activeContract,
      this.latestReport});

  factory _$MonitoringDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final int homeownerId;
  @override
  final String homeownerName;
  @override
  final String homeownerEmail;
  @override
  final int? supervisorId;
  @override
  final String? supervisorName;
  @override
  final String? supervisorEmail;
  @override
  final String projectId;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? completionDocumentUrl;
  @override
  final String? completionNotes;
  @override
  final DateTime? completionRequestedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int totalReports;
  @override
  final int totalFindings;
  @override
  final int totalDocuments;
  @override
  final int totalContracts;
  @override
  final MonitoringContractModel? activeContract;
  @override
  final ReportDetailModel? latestReport;

  @override
  String toString() {
    return 'MonitoringDetailModel(id: $id, homeownerId: $homeownerId, homeownerName: $homeownerName, homeownerEmail: $homeownerEmail, supervisorId: $supervisorId, supervisorName: $supervisorName, supervisorEmail: $supervisorEmail, projectId: $projectId, type: $type, status: $status, completionDocumentUrl: $completionDocumentUrl, completionNotes: $completionNotes, completionRequestedAt: $completionRequestedAt, createdAt: $createdAt, updatedAt: $updatedAt, totalReports: $totalReports, totalFindings: $totalFindings, totalDocuments: $totalDocuments, totalContracts: $totalContracts, activeContract: $activeContract, latestReport: $latestReport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeownerId, homeownerId) ||
                other.homeownerId == homeownerId) &&
            (identical(other.homeownerName, homeownerName) ||
                other.homeownerName == homeownerName) &&
            (identical(other.homeownerEmail, homeownerEmail) ||
                other.homeownerEmail == homeownerEmail) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName) &&
            (identical(other.supervisorEmail, supervisorEmail) ||
                other.supervisorEmail == supervisorEmail) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completionDocumentUrl, completionDocumentUrl) ||
                other.completionDocumentUrl == completionDocumentUrl) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.completionRequestedAt, completionRequestedAt) ||
                other.completionRequestedAt == completionRequestedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.totalReports, totalReports) ||
                other.totalReports == totalReports) &&
            (identical(other.totalFindings, totalFindings) ||
                other.totalFindings == totalFindings) &&
            (identical(other.totalDocuments, totalDocuments) ||
                other.totalDocuments == totalDocuments) &&
            (identical(other.totalContracts, totalContracts) ||
                other.totalContracts == totalContracts) &&
            (identical(other.activeContract, activeContract) ||
                other.activeContract == activeContract) &&
            (identical(other.latestReport, latestReport) ||
                other.latestReport == latestReport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        homeownerId,
        homeownerName,
        homeownerEmail,
        supervisorId,
        supervisorName,
        supervisorEmail,
        projectId,
        type,
        status,
        completionDocumentUrl,
        completionNotes,
        completionRequestedAt,
        createdAt,
        updatedAt,
        totalReports,
        totalFindings,
        totalDocuments,
        totalContracts,
        activeContract,
        latestReport
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringDetailModelImplCopyWith<_$MonitoringDetailModelImpl>
      get copyWith => __$$MonitoringDetailModelImplCopyWithImpl<
          _$MonitoringDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MonitoringDetailModel implements MonitoringDetailModel {
  const factory _MonitoringDetailModel(
      {required final int id,
      required final int homeownerId,
      required final String homeownerName,
      required final String homeownerEmail,
      final int? supervisorId,
      final String? supervisorName,
      final String? supervisorEmail,
      required final String projectId,
      required final String type,
      required final String status,
      final String? completionDocumentUrl,
      final String? completionNotes,
      final DateTime? completionRequestedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int totalReports,
      required final int totalFindings,
      required final int totalDocuments,
      required final int totalContracts,
      final MonitoringContractModel? activeContract,
      final ReportDetailModel? latestReport}) = _$MonitoringDetailModelImpl;

  factory _MonitoringDetailModel.fromJson(Map<String, dynamic> json) =
      _$MonitoringDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  int get homeownerId;
  @override
  String get homeownerName;
  @override
  String get homeownerEmail;
  @override
  int? get supervisorId;
  @override
  String? get supervisorName;
  @override
  String? get supervisorEmail;
  @override
  String get projectId;
  @override
  String get type;
  @override
  String get status;
  @override
  String? get completionDocumentUrl;
  @override
  String? get completionNotes;
  @override
  DateTime? get completionRequestedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get totalReports;
  @override
  int get totalFindings;
  @override
  int get totalDocuments;
  @override
  int get totalContracts;
  @override
  MonitoringContractModel? get activeContract;
  @override
  ReportDetailModel? get latestReport;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringDetailModelImplCopyWith<_$MonitoringDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
