// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MonitoringContractModel _$MonitoringContractModelFromJson(
  Map<String, dynamic> json,
) {
  return _MonitoringContractModel.fromJson(json);
}

/// @nodoc
mixin _$MonitoringContractModel {
  int get id => throw _privateConstructorUsedError;
  int get monitoringId => throw _privateConstructorUsedError;
  int get supervisorId => throw _privateConstructorUsedError;
  String get supervisorName => throw _privateConstructorUsedError;
  String get documentUrl => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // PENDING, DECLINED, ACCEPTED, FULLY_SIGNED, etc.
  int get revisionCount => throw _privateConstructorUsedError;
  DateTime? get homeownerSignedAt => throw _privateConstructorUsedError;
  DateTime? get supervisorSignedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringContractModelCopyWith<MonitoringContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringContractModelCopyWith<$Res> {
  factory $MonitoringContractModelCopyWith(
    MonitoringContractModel value,
    $Res Function(MonitoringContractModel) then,
  ) = _$MonitoringContractModelCopyWithImpl<$Res, MonitoringContractModel>;
  @useResult
  $Res call({
    int id,
    int monitoringId,
    int supervisorId,
    String supervisorName,
    String documentUrl,
    String status,
    int revisionCount,
    DateTime? homeownerSignedAt,
    DateTime? supervisorSignedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class _$MonitoringContractModelCopyWithImpl<
  $Res,
  $Val extends MonitoringContractModel
>
    implements $MonitoringContractModelCopyWith<$Res> {
  _$MonitoringContractModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monitoringId = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
    Object? documentUrl = null,
    Object? status = null,
    Object? revisionCount = null,
    Object? homeownerSignedAt = freezed,
    Object? supervisorSignedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            documentUrl: null == documentUrl
                ? _value.documentUrl
                : documentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            revisionCount: null == revisionCount
                ? _value.revisionCount
                : revisionCount // ignore: cast_nullable_to_non_nullable
                      as int,
            homeownerSignedAt: freezed == homeownerSignedAt
                ? _value.homeownerSignedAt
                : homeownerSignedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            supervisorSignedAt: freezed == supervisorSignedAt
                ? _value.supervisorSignedAt
                : supervisorSignedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonitoringContractModelImplCopyWith<$Res>
    implements $MonitoringContractModelCopyWith<$Res> {
  factory _$$MonitoringContractModelImplCopyWith(
    _$MonitoringContractModelImpl value,
    $Res Function(_$MonitoringContractModelImpl) then,
  ) = __$$MonitoringContractModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int monitoringId,
    int supervisorId,
    String supervisorName,
    String documentUrl,
    String status,
    int revisionCount,
    DateTime? homeownerSignedAt,
    DateTime? supervisorSignedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$MonitoringContractModelImplCopyWithImpl<$Res>
    extends
        _$MonitoringContractModelCopyWithImpl<
          $Res,
          _$MonitoringContractModelImpl
        >
    implements _$$MonitoringContractModelImplCopyWith<$Res> {
  __$$MonitoringContractModelImplCopyWithImpl(
    _$MonitoringContractModelImpl _value,
    $Res Function(_$MonitoringContractModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monitoringId = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
    Object? documentUrl = null,
    Object? status = null,
    Object? revisionCount = null,
    Object? homeownerSignedAt = freezed,
    Object? supervisorSignedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$MonitoringContractModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        documentUrl: null == documentUrl
            ? _value.documentUrl
            : documentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        revisionCount: null == revisionCount
            ? _value.revisionCount
            : revisionCount // ignore: cast_nullable_to_non_nullable
                  as int,
        homeownerSignedAt: freezed == homeownerSignedAt
            ? _value.homeownerSignedAt
            : homeownerSignedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        supervisorSignedAt: freezed == supervisorSignedAt
            ? _value.supervisorSignedAt
            : supervisorSignedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringContractModelImpl implements _MonitoringContractModel {
  const _$MonitoringContractModelImpl({
    required this.id,
    required this.monitoringId,
    required this.supervisorId,
    required this.supervisorName,
    required this.documentUrl,
    required this.status,
    required this.revisionCount,
    this.homeownerSignedAt,
    this.supervisorSignedAt,
    required this.createdAt,
  });

  factory _$MonitoringContractModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringContractModelImplFromJson(json);

  @override
  final int id;
  @override
  final int monitoringId;
  @override
  final int supervisorId;
  @override
  final String supervisorName;
  @override
  final String documentUrl;
  @override
  final String status;
  // PENDING, DECLINED, ACCEPTED, FULLY_SIGNED, etc.
  @override
  final int revisionCount;
  @override
  final DateTime? homeownerSignedAt;
  @override
  final DateTime? supervisorSignedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MonitoringContractModel(id: $id, monitoringId: $monitoringId, supervisorId: $supervisorId, supervisorName: $supervisorName, documentUrl: $documentUrl, status: $status, revisionCount: $revisionCount, homeownerSignedAt: $homeownerSignedAt, supervisorSignedAt: $supervisorSignedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringContractModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.monitoringId, monitoringId) ||
                other.monitoringId == monitoringId) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.revisionCount, revisionCount) ||
                other.revisionCount == revisionCount) &&
            (identical(other.homeownerSignedAt, homeownerSignedAt) ||
                other.homeownerSignedAt == homeownerSignedAt) &&
            (identical(other.supervisorSignedAt, supervisorSignedAt) ||
                other.supervisorSignedAt == supervisorSignedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    monitoringId,
    supervisorId,
    supervisorName,
    documentUrl,
    status,
    revisionCount,
    homeownerSignedAt,
    supervisorSignedAt,
    createdAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringContractModelImplCopyWith<_$MonitoringContractModelImpl>
  get copyWith =>
      __$$MonitoringContractModelImplCopyWithImpl<
        _$MonitoringContractModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringContractModelImplToJson(this);
  }
}

abstract class _MonitoringContractModel implements MonitoringContractModel {
  const factory _MonitoringContractModel({
    required final int id,
    required final int monitoringId,
    required final int supervisorId,
    required final String supervisorName,
    required final String documentUrl,
    required final String status,
    required final int revisionCount,
    final DateTime? homeownerSignedAt,
    final DateTime? supervisorSignedAt,
    required final DateTime createdAt,
  }) = _$MonitoringContractModelImpl;

  factory _MonitoringContractModel.fromJson(Map<String, dynamic> json) =
      _$MonitoringContractModelImpl.fromJson;

  @override
  int get id;
  @override
  int get monitoringId;
  @override
  int get supervisorId;
  @override
  String get supervisorName;
  @override
  String get documentUrl;
  @override
  String get status;
  @override // PENDING, DECLINED, ACCEPTED, FULLY_SIGNED, etc.
  int get revisionCount;
  @override
  DateTime? get homeownerSignedAt;
  @override
  DateTime? get supervisorSignedAt;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringContractModelImplCopyWith<_$MonitoringContractModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
