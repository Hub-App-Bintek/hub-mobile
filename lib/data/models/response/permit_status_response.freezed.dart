// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permit_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermitStatusResponse _$PermitStatusResponseFromJson(Map<String, dynamic> json) {
  return _PermitStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$PermitStatusResponse {
  PermitDetails get permit => throw _privateConstructorUsedError;
  StatusDetails get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermitStatusResponseCopyWith<PermitStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitStatusResponseCopyWith<$Res> {
  factory $PermitStatusResponseCopyWith(PermitStatusResponse value,
          $Res Function(PermitStatusResponse) then) =
      _$PermitStatusResponseCopyWithImpl<$Res, PermitStatusResponse>;
  @useResult
  $Res call({PermitDetails permit, StatusDetails status});

  $PermitDetailsCopyWith<$Res> get permit;
  $StatusDetailsCopyWith<$Res> get status;
}

/// @nodoc
class _$PermitStatusResponseCopyWithImpl<$Res,
        $Val extends PermitStatusResponse>
    implements $PermitStatusResponseCopyWith<$Res> {
  _$PermitStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permit = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      permit: null == permit
          ? _value.permit
          : permit // ignore: cast_nullable_to_non_nullable
              as PermitDetails,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermitDetailsCopyWith<$Res> get permit {
    return $PermitDetailsCopyWith<$Res>(_value.permit, (value) {
      return _then(_value.copyWith(permit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusDetailsCopyWith<$Res> get status {
    return $StatusDetailsCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermitStatusResponseImplCopyWith<$Res>
    implements $PermitStatusResponseCopyWith<$Res> {
  factory _$$PermitStatusResponseImplCopyWith(_$PermitStatusResponseImpl value,
          $Res Function(_$PermitStatusResponseImpl) then) =
      __$$PermitStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PermitDetails permit, StatusDetails status});

  @override
  $PermitDetailsCopyWith<$Res> get permit;
  @override
  $StatusDetailsCopyWith<$Res> get status;
}

/// @nodoc
class __$$PermitStatusResponseImplCopyWithImpl<$Res>
    extends _$PermitStatusResponseCopyWithImpl<$Res, _$PermitStatusResponseImpl>
    implements _$$PermitStatusResponseImplCopyWith<$Res> {
  __$$PermitStatusResponseImplCopyWithImpl(_$PermitStatusResponseImpl _value,
      $Res Function(_$PermitStatusResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permit = null,
    Object? status = null,
  }) {
    return _then(_$PermitStatusResponseImpl(
      permit: null == permit
          ? _value.permit
          : permit // ignore: cast_nullable_to_non_nullable
              as PermitDetails,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermitStatusResponseImpl implements _PermitStatusResponse {
  const _$PermitStatusResponseImpl(
      {required this.permit, required this.status});

  factory _$PermitStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitStatusResponseImplFromJson(json);

  @override
  final PermitDetails permit;
  @override
  final StatusDetails status;

  @override
  String toString() {
    return 'PermitStatusResponse(permit: $permit, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitStatusResponseImpl &&
            (identical(other.permit, permit) || other.permit == permit) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, permit, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitStatusResponseImplCopyWith<_$PermitStatusResponseImpl>
      get copyWith =>
          __$$PermitStatusResponseImplCopyWithImpl<_$PermitStatusResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _PermitStatusResponse implements PermitStatusResponse {
  const factory _PermitStatusResponse(
      {required final PermitDetails permit,
      required final StatusDetails status}) = _$PermitStatusResponseImpl;

  factory _PermitStatusResponse.fromJson(Map<String, dynamic> json) =
      _$PermitStatusResponseImpl.fromJson;

  @override
  PermitDetails get permit;
  @override
  StatusDetails get status;
  @override
  @JsonKey(ignore: true)
  _$$PermitStatusResponseImplCopyWith<_$PermitStatusResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PermitDetails _$PermitDetailsFromJson(Map<String, dynamic> json) {
  return _PermitDetails.fromJson(json);
}

/// @nodoc
mixin _$PermitDetails {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String? get simbgId => throw _privateConstructorUsedError;
  String get permitType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get dedDocumentUrl => throw _privateConstructorUsedError;
  String? get pbgDocumentUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermitDetailsCopyWith<PermitDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitDetailsCopyWith<$Res> {
  factory $PermitDetailsCopyWith(
          PermitDetails value, $Res Function(PermitDetails) then) =
      _$PermitDetailsCopyWithImpl<$Res, PermitDetails>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String? simbgId,
      String permitType,
      String status,
      DateTime? submittedAt,
      DateTime? approvedAt,
      String? dedDocumentUrl,
      String? pbgDocumentUrl,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PermitDetailsCopyWithImpl<$Res, $Val extends PermitDetails>
    implements $PermitDetailsCopyWith<$Res> {
  _$PermitDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? simbgId = freezed,
    Object? permitType = null,
    Object? status = null,
    Object? submittedAt = freezed,
    Object? approvedAt = freezed,
    Object? dedDocumentUrl = freezed,
    Object? pbgDocumentUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      simbgId: freezed == simbgId
          ? _value.simbgId
          : simbgId // ignore: cast_nullable_to_non_nullable
              as String?,
      permitType: null == permitType
          ? _value.permitType
          : permitType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dedDocumentUrl: freezed == dedDocumentUrl
          ? _value.dedDocumentUrl
          : dedDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pbgDocumentUrl: freezed == pbgDocumentUrl
          ? _value.pbgDocumentUrl
          : pbgDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermitDetailsImplCopyWith<$Res>
    implements $PermitDetailsCopyWith<$Res> {
  factory _$$PermitDetailsImplCopyWith(
          _$PermitDetailsImpl value, $Res Function(_$PermitDetailsImpl) then) =
      __$$PermitDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String? simbgId,
      String permitType,
      String status,
      DateTime? submittedAt,
      DateTime? approvedAt,
      String? dedDocumentUrl,
      String? pbgDocumentUrl,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PermitDetailsImplCopyWithImpl<$Res>
    extends _$PermitDetailsCopyWithImpl<$Res, _$PermitDetailsImpl>
    implements _$$PermitDetailsImplCopyWith<$Res> {
  __$$PermitDetailsImplCopyWithImpl(
      _$PermitDetailsImpl _value, $Res Function(_$PermitDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? simbgId = freezed,
    Object? permitType = null,
    Object? status = null,
    Object? submittedAt = freezed,
    Object? approvedAt = freezed,
    Object? dedDocumentUrl = freezed,
    Object? pbgDocumentUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PermitDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      simbgId: freezed == simbgId
          ? _value.simbgId
          : simbgId // ignore: cast_nullable_to_non_nullable
              as String?,
      permitType: null == permitType
          ? _value.permitType
          : permitType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dedDocumentUrl: freezed == dedDocumentUrl
          ? _value.dedDocumentUrl
          : dedDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pbgDocumentUrl: freezed == pbgDocumentUrl
          ? _value.pbgDocumentUrl
          : pbgDocumentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermitDetailsImpl implements _PermitDetails {
  const _$PermitDetailsImpl(
      {required this.id,
      required this.projectId,
      this.simbgId,
      required this.permitType,
      required this.status,
      this.submittedAt,
      this.approvedAt,
      this.dedDocumentUrl,
      this.pbgDocumentUrl,
      this.notes,
      required this.createdAt,
      required this.updatedAt});

  factory _$PermitDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String? simbgId;
  @override
  final String permitType;
  @override
  final String status;
  @override
  final DateTime? submittedAt;
  @override
  final DateTime? approvedAt;
  @override
  final String? dedDocumentUrl;
  @override
  final String? pbgDocumentUrl;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PermitDetails(id: $id, projectId: $projectId, simbgId: $simbgId, permitType: $permitType, status: $status, submittedAt: $submittedAt, approvedAt: $approvedAt, dedDocumentUrl: $dedDocumentUrl, pbgDocumentUrl: $pbgDocumentUrl, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.simbgId, simbgId) || other.simbgId == simbgId) &&
            (identical(other.permitType, permitType) ||
                other.permitType == permitType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.dedDocumentUrl, dedDocumentUrl) ||
                other.dedDocumentUrl == dedDocumentUrl) &&
            (identical(other.pbgDocumentUrl, pbgDocumentUrl) ||
                other.pbgDocumentUrl == pbgDocumentUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      simbgId,
      permitType,
      status,
      submittedAt,
      approvedAt,
      dedDocumentUrl,
      pbgDocumentUrl,
      notes,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitDetailsImplCopyWith<_$PermitDetailsImpl> get copyWith =>
      __$$PermitDetailsImplCopyWithImpl<_$PermitDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitDetailsImplToJson(
      this,
    );
  }
}

abstract class _PermitDetails implements PermitDetails {
  const factory _PermitDetails(
      {required final String id,
      required final String projectId,
      final String? simbgId,
      required final String permitType,
      required final String status,
      final DateTime? submittedAt,
      final DateTime? approvedAt,
      final String? dedDocumentUrl,
      final String? pbgDocumentUrl,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PermitDetailsImpl;

  factory _PermitDetails.fromJson(Map<String, dynamic> json) =
      _$PermitDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String? get simbgId;
  @override
  String get permitType;
  @override
  String get status;
  @override
  DateTime? get submittedAt;
  @override
  DateTime? get approvedAt;
  @override
  String? get dedDocumentUrl;
  @override
  String? get pbgDocumentUrl;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PermitDetailsImplCopyWith<_$PermitDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusDetails _$StatusDetailsFromJson(Map<String, dynamic> json) {
  return _StatusDetails.fromJson(json);
}

/// @nodoc
mixin _$StatusDetails {
  String? get simbgId => throw _privateConstructorUsedError;
  String? get externalReference => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<StatusHistoryItem> get history => throw _privateConstructorUsedError;
  AssignedOffice? get assignedOffice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusDetailsCopyWith<StatusDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusDetailsCopyWith<$Res> {
  factory $StatusDetailsCopyWith(
          StatusDetails value, $Res Function(StatusDetails) then) =
      _$StatusDetailsCopyWithImpl<$Res, StatusDetails>;
  @useResult
  $Res call(
      {String? simbgId,
      String? externalReference,
      String status,
      List<StatusHistoryItem> history,
      AssignedOffice? assignedOffice});

  $AssignedOfficeCopyWith<$Res>? get assignedOffice;
}

/// @nodoc
class _$StatusDetailsCopyWithImpl<$Res, $Val extends StatusDetails>
    implements $StatusDetailsCopyWith<$Res> {
  _$StatusDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simbgId = freezed,
    Object? externalReference = freezed,
    Object? status = null,
    Object? history = null,
    Object? assignedOffice = freezed,
  }) {
    return _then(_value.copyWith(
      simbgId: freezed == simbgId
          ? _value.simbgId
          : simbgId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalReference: freezed == externalReference
          ? _value.externalReference
          : externalReference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<StatusHistoryItem>,
      assignedOffice: freezed == assignedOffice
          ? _value.assignedOffice
          : assignedOffice // ignore: cast_nullable_to_non_nullable
              as AssignedOffice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignedOfficeCopyWith<$Res>? get assignedOffice {
    if (_value.assignedOffice == null) {
      return null;
    }

    return $AssignedOfficeCopyWith<$Res>(_value.assignedOffice!, (value) {
      return _then(_value.copyWith(assignedOffice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatusDetailsImplCopyWith<$Res>
    implements $StatusDetailsCopyWith<$Res> {
  factory _$$StatusDetailsImplCopyWith(
          _$StatusDetailsImpl value, $Res Function(_$StatusDetailsImpl) then) =
      __$$StatusDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? simbgId,
      String? externalReference,
      String status,
      List<StatusHistoryItem> history,
      AssignedOffice? assignedOffice});

  @override
  $AssignedOfficeCopyWith<$Res>? get assignedOffice;
}

/// @nodoc
class __$$StatusDetailsImplCopyWithImpl<$Res>
    extends _$StatusDetailsCopyWithImpl<$Res, _$StatusDetailsImpl>
    implements _$$StatusDetailsImplCopyWith<$Res> {
  __$$StatusDetailsImplCopyWithImpl(
      _$StatusDetailsImpl _value, $Res Function(_$StatusDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simbgId = freezed,
    Object? externalReference = freezed,
    Object? status = null,
    Object? history = null,
    Object? assignedOffice = freezed,
  }) {
    return _then(_$StatusDetailsImpl(
      simbgId: freezed == simbgId
          ? _value.simbgId
          : simbgId // ignore: cast_nullable_to_non_nullable
              as String?,
      externalReference: freezed == externalReference
          ? _value.externalReference
          : externalReference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<StatusHistoryItem>,
      assignedOffice: freezed == assignedOffice
          ? _value.assignedOffice
          : assignedOffice // ignore: cast_nullable_to_non_nullable
              as AssignedOffice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusDetailsImpl implements _StatusDetails {
  const _$StatusDetailsImpl(
      {this.simbgId,
      this.externalReference,
      required this.status,
      final List<StatusHistoryItem> history = const [],
      this.assignedOffice})
      : _history = history;

  factory _$StatusDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusDetailsImplFromJson(json);

  @override
  final String? simbgId;
  @override
  final String? externalReference;
  @override
  final String status;
  final List<StatusHistoryItem> _history;
  @override
  @JsonKey()
  List<StatusHistoryItem> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final AssignedOffice? assignedOffice;

  @override
  String toString() {
    return 'StatusDetails(simbgId: $simbgId, externalReference: $externalReference, status: $status, history: $history, assignedOffice: $assignedOffice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusDetailsImpl &&
            (identical(other.simbgId, simbgId) || other.simbgId == simbgId) &&
            (identical(other.externalReference, externalReference) ||
                other.externalReference == externalReference) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.assignedOffice, assignedOffice) ||
                other.assignedOffice == assignedOffice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, simbgId, externalReference,
      status, const DeepCollectionEquality().hash(_history), assignedOffice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusDetailsImplCopyWith<_$StatusDetailsImpl> get copyWith =>
      __$$StatusDetailsImplCopyWithImpl<_$StatusDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusDetailsImplToJson(
      this,
    );
  }
}

abstract class _StatusDetails implements StatusDetails {
  const factory _StatusDetails(
      {final String? simbgId,
      final String? externalReference,
      required final String status,
      final List<StatusHistoryItem> history,
      final AssignedOffice? assignedOffice}) = _$StatusDetailsImpl;

  factory _StatusDetails.fromJson(Map<String, dynamic> json) =
      _$StatusDetailsImpl.fromJson;

  @override
  String? get simbgId;
  @override
  String? get externalReference;
  @override
  String get status;
  @override
  List<StatusHistoryItem> get history;
  @override
  AssignedOffice? get assignedOffice;
  @override
  @JsonKey(ignore: true)
  _$$StatusDetailsImplCopyWith<_$StatusDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusHistoryItem _$StatusHistoryItemFromJson(Map<String, dynamic> json) {
  return _StatusHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$StatusHistoryItem {
  String get status => throw _privateConstructorUsedError;
  DateTime get at => throw _privateConstructorUsedError;
  String get by => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusHistoryItemCopyWith<StatusHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryItemCopyWith<$Res> {
  factory $StatusHistoryItemCopyWith(
          StatusHistoryItem value, $Res Function(StatusHistoryItem) then) =
      _$StatusHistoryItemCopyWithImpl<$Res, StatusHistoryItem>;
  @useResult
  $Res call({String status, DateTime at, String by});
}

/// @nodoc
class _$StatusHistoryItemCopyWithImpl<$Res, $Val extends StatusHistoryItem>
    implements $StatusHistoryItemCopyWith<$Res> {
  _$StatusHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? at = null,
    Object? by = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusHistoryItemImplCopyWith<$Res>
    implements $StatusHistoryItemCopyWith<$Res> {
  factory _$$StatusHistoryItemImplCopyWith(_$StatusHistoryItemImpl value,
          $Res Function(_$StatusHistoryItemImpl) then) =
      __$$StatusHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime at, String by});
}

/// @nodoc
class __$$StatusHistoryItemImplCopyWithImpl<$Res>
    extends _$StatusHistoryItemCopyWithImpl<$Res, _$StatusHistoryItemImpl>
    implements _$$StatusHistoryItemImplCopyWith<$Res> {
  __$$StatusHistoryItemImplCopyWithImpl(_$StatusHistoryItemImpl _value,
      $Res Function(_$StatusHistoryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? at = null,
    Object? by = null,
  }) {
    return _then(_$StatusHistoryItemImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      by: null == by
          ? _value.by
          : by // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusHistoryItemImpl implements _StatusHistoryItem {
  const _$StatusHistoryItemImpl(
      {required this.status, required this.at, required this.by});

  factory _$StatusHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusHistoryItemImplFromJson(json);

  @override
  final String status;
  @override
  final DateTime at;
  @override
  final String by;

  @override
  String toString() {
    return 'StatusHistoryItem(status: $status, at: $at, by: $by)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusHistoryItemImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.by, by) || other.by == by));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, at, by);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusHistoryItemImplCopyWith<_$StatusHistoryItemImpl> get copyWith =>
      __$$StatusHistoryItemImplCopyWithImpl<_$StatusHistoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusHistoryItemImplToJson(
      this,
    );
  }
}

abstract class _StatusHistoryItem implements StatusHistoryItem {
  const factory _StatusHistoryItem(
      {required final String status,
      required final DateTime at,
      required final String by}) = _$StatusHistoryItemImpl;

  factory _StatusHistoryItem.fromJson(Map<String, dynamic> json) =
      _$StatusHistoryItemImpl.fromJson;

  @override
  String get status;
  @override
  DateTime get at;
  @override
  String get by;
  @override
  @JsonKey(ignore: true)
  _$$StatusHistoryItemImplCopyWith<_$StatusHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignedOffice _$AssignedOfficeFromJson(Map<String, dynamic> json) {
  return _AssignedOffice.fromJson(json);
}

/// @nodoc
mixin _$AssignedOffice {
  String? get regionCode => throw _privateConstructorUsedError;
  String? get officeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedOfficeCopyWith<AssignedOffice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedOfficeCopyWith<$Res> {
  factory $AssignedOfficeCopyWith(
          AssignedOffice value, $Res Function(AssignedOffice) then) =
      _$AssignedOfficeCopyWithImpl<$Res, AssignedOffice>;
  @useResult
  $Res call({String? regionCode, String? officeName});
}

/// @nodoc
class _$AssignedOfficeCopyWithImpl<$Res, $Val extends AssignedOffice>
    implements $AssignedOfficeCopyWith<$Res> {
  _$AssignedOfficeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? officeName = freezed,
  }) {
    return _then(_value.copyWith(
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      officeName: freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignedOfficeImplCopyWith<$Res>
    implements $AssignedOfficeCopyWith<$Res> {
  factory _$$AssignedOfficeImplCopyWith(_$AssignedOfficeImpl value,
          $Res Function(_$AssignedOfficeImpl) then) =
      __$$AssignedOfficeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? regionCode, String? officeName});
}

/// @nodoc
class __$$AssignedOfficeImplCopyWithImpl<$Res>
    extends _$AssignedOfficeCopyWithImpl<$Res, _$AssignedOfficeImpl>
    implements _$$AssignedOfficeImplCopyWith<$Res> {
  __$$AssignedOfficeImplCopyWithImpl(
      _$AssignedOfficeImpl _value, $Res Function(_$AssignedOfficeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? officeName = freezed,
  }) {
    return _then(_$AssignedOfficeImpl(
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      officeName: freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignedOfficeImpl implements _AssignedOffice {
  const _$AssignedOfficeImpl({this.regionCode, this.officeName});

  factory _$AssignedOfficeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignedOfficeImplFromJson(json);

  @override
  final String? regionCode;
  @override
  final String? officeName;

  @override
  String toString() {
    return 'AssignedOffice(regionCode: $regionCode, officeName: $officeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignedOfficeImpl &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.officeName, officeName) ||
                other.officeName == officeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, regionCode, officeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignedOfficeImplCopyWith<_$AssignedOfficeImpl> get copyWith =>
      __$$AssignedOfficeImplCopyWithImpl<_$AssignedOfficeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignedOfficeImplToJson(
      this,
    );
  }
}

abstract class _AssignedOffice implements AssignedOffice {
  const factory _AssignedOffice(
      {final String? regionCode,
      final String? officeName}) = _$AssignedOfficeImpl;

  factory _AssignedOffice.fromJson(Map<String, dynamic> json) =
      _$AssignedOfficeImpl.fromJson;

  @override
  String? get regionCode;
  @override
  String? get officeName;
  @override
  @JsonKey(ignore: true)
  _$$AssignedOfficeImplCopyWith<_$AssignedOfficeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
