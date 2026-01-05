// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_completion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobCompletionModel _$JobCompletionModelFromJson(Map<String, dynamic> json) {
  return _JobCompletionModel.fromJson(json);
}

/// @nodoc
mixin _$JobCompletionModel {
  int get monitoringId => throw _privateConstructorUsedError;
  int get supervisorId => throw _privateConstructorUsedError;
  String get supervisorName => throw _privateConstructorUsedError;
  String? get completionDocumentUrl => throw _privateConstructorUsedError;
  String? get completionNotes => throw _privateConstructorUsedError;
  DateTime? get completionRequestedAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get isApprovedByHomeowner => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobCompletionModelCopyWith<JobCompletionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCompletionModelCopyWith<$Res> {
  factory $JobCompletionModelCopyWith(
          JobCompletionModel value, $Res Function(JobCompletionModel) then) =
      _$JobCompletionModelCopyWithImpl<$Res, JobCompletionModel>;
  @useResult
  $Res call(
      {int monitoringId,
      int supervisorId,
      String supervisorName,
      String? completionDocumentUrl,
      String? completionNotes,
      DateTime? completionRequestedAt,
      String status,
      bool isApprovedByHomeowner,
      DateTime? approvedAt});
}

/// @nodoc
class _$JobCompletionModelCopyWithImpl<$Res, $Val extends JobCompletionModel>
    implements $JobCompletionModelCopyWith<$Res> {
  _$JobCompletionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monitoringId = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
    Object? completionDocumentUrl = freezed,
    Object? completionNotes = freezed,
    Object? completionRequestedAt = freezed,
    Object? status = null,
    Object? isApprovedByHomeowner = null,
    Object? approvedAt = freezed,
  }) {
    return _then(_value.copyWith(
      monitoringId: null == monitoringId
          ? _value.monitoringId
          : monitoringId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorId: null == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorName: null == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isApprovedByHomeowner: null == isApprovedByHomeowner
          ? _value.isApprovedByHomeowner
          : isApprovedByHomeowner // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobCompletionModelImplCopyWith<$Res>
    implements $JobCompletionModelCopyWith<$Res> {
  factory _$$JobCompletionModelImplCopyWith(_$JobCompletionModelImpl value,
          $Res Function(_$JobCompletionModelImpl) then) =
      __$$JobCompletionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int monitoringId,
      int supervisorId,
      String supervisorName,
      String? completionDocumentUrl,
      String? completionNotes,
      DateTime? completionRequestedAt,
      String status,
      bool isApprovedByHomeowner,
      DateTime? approvedAt});
}

/// @nodoc
class __$$JobCompletionModelImplCopyWithImpl<$Res>
    extends _$JobCompletionModelCopyWithImpl<$Res, _$JobCompletionModelImpl>
    implements _$$JobCompletionModelImplCopyWith<$Res> {
  __$$JobCompletionModelImplCopyWithImpl(_$JobCompletionModelImpl _value,
      $Res Function(_$JobCompletionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monitoringId = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
    Object? completionDocumentUrl = freezed,
    Object? completionNotes = freezed,
    Object? completionRequestedAt = freezed,
    Object? status = null,
    Object? isApprovedByHomeowner = null,
    Object? approvedAt = freezed,
  }) {
    return _then(_$JobCompletionModelImpl(
      monitoringId: null == monitoringId
          ? _value.monitoringId
          : monitoringId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorId: null == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorName: null == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isApprovedByHomeowner: null == isApprovedByHomeowner
          ? _value.isApprovedByHomeowner
          : isApprovedByHomeowner // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobCompletionModelImpl implements _JobCompletionModel {
  const _$JobCompletionModelImpl(
      {required this.monitoringId,
      required this.supervisorId,
      required this.supervisorName,
      this.completionDocumentUrl,
      this.completionNotes,
      this.completionRequestedAt,
      required this.status,
      required this.isApprovedByHomeowner,
      this.approvedAt});

  factory _$JobCompletionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobCompletionModelImplFromJson(json);

  @override
  final int monitoringId;
  @override
  final int supervisorId;
  @override
  final String supervisorName;
  @override
  final String? completionDocumentUrl;
  @override
  final String? completionNotes;
  @override
  final DateTime? completionRequestedAt;
  @override
  final String status;
  @override
  final bool isApprovedByHomeowner;
  @override
  final DateTime? approvedAt;

  @override
  String toString() {
    return 'JobCompletionModel(monitoringId: $monitoringId, supervisorId: $supervisorId, supervisorName: $supervisorName, completionDocumentUrl: $completionDocumentUrl, completionNotes: $completionNotes, completionRequestedAt: $completionRequestedAt, status: $status, isApprovedByHomeowner: $isApprovedByHomeowner, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobCompletionModelImpl &&
            (identical(other.monitoringId, monitoringId) ||
                other.monitoringId == monitoringId) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName) &&
            (identical(other.completionDocumentUrl, completionDocumentUrl) ||
                other.completionDocumentUrl == completionDocumentUrl) &&
            (identical(other.completionNotes, completionNotes) ||
                other.completionNotes == completionNotes) &&
            (identical(other.completionRequestedAt, completionRequestedAt) ||
                other.completionRequestedAt == completionRequestedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isApprovedByHomeowner, isApprovedByHomeowner) ||
                other.isApprovedByHomeowner == isApprovedByHomeowner) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      monitoringId,
      supervisorId,
      supervisorName,
      completionDocumentUrl,
      completionNotes,
      completionRequestedAt,
      status,
      isApprovedByHomeowner,
      approvedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobCompletionModelImplCopyWith<_$JobCompletionModelImpl> get copyWith =>
      __$$JobCompletionModelImplCopyWithImpl<_$JobCompletionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobCompletionModelImplToJson(
      this,
    );
  }
}

abstract class _JobCompletionModel implements JobCompletionModel {
  const factory _JobCompletionModel(
      {required final int monitoringId,
      required final int supervisorId,
      required final String supervisorName,
      final String? completionDocumentUrl,
      final String? completionNotes,
      final DateTime? completionRequestedAt,
      required final String status,
      required final bool isApprovedByHomeowner,
      final DateTime? approvedAt}) = _$JobCompletionModelImpl;

  factory _JobCompletionModel.fromJson(Map<String, dynamic> json) =
      _$JobCompletionModelImpl.fromJson;

  @override
  int get monitoringId;
  @override
  int get supervisorId;
  @override
  String get supervisorName;
  @override
  String? get completionDocumentUrl;
  @override
  String? get completionNotes;
  @override
  DateTime? get completionRequestedAt;
  @override
  String get status;
  @override
  bool get isApprovedByHomeowner;
  @override
  DateTime? get approvedAt;
  @override
  @JsonKey(ignore: true)
  _$$JobCompletionModelImplCopyWith<_$JobCompletionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
