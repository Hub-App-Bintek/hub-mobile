// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_monitoring_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringResponse _$MonitoringResponseFromJson(Map<String, dynamic> json) {
  return _MonitoringResponse.fromJson(json);
}

/// @nodoc
mixin _$MonitoringResponse {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get homeownerId => throw _privateConstructorUsedError;
  int? get supervisorId => throw _privateConstructorUsedError;
  String get projectAddress => throw _privateConstructorUsedError;
  String get projectDescription => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringResponseCopyWith<MonitoringResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringResponseCopyWith<$Res> {
  factory $MonitoringResponseCopyWith(
          MonitoringResponse value, $Res Function(MonitoringResponse) then) =
      _$MonitoringResponseCopyWithImpl<$Res, MonitoringResponse>;
  @useResult
  $Res call(
      {int id,
      String type,
      String status,
      int homeownerId,
      int? supervisorId,
      String projectAddress,
      String projectDescription,
      DateTime createdAt});
}

/// @nodoc
class _$MonitoringResponseCopyWithImpl<$Res, $Val extends MonitoringResponse>
    implements $MonitoringResponseCopyWith<$Res> {
  _$MonitoringResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? homeownerId = null,
    Object? supervisorId = freezed,
    Object? projectAddress = null,
    Object? projectDescription = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeownerId: null == homeownerId
          ? _value.homeownerId
          : homeownerId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectAddress: null == projectAddress
          ? _value.projectAddress
          : projectAddress // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: null == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringResponseImplCopyWith<$Res>
    implements $MonitoringResponseCopyWith<$Res> {
  factory _$$MonitoringResponseImplCopyWith(_$MonitoringResponseImpl value,
          $Res Function(_$MonitoringResponseImpl) then) =
      __$$MonitoringResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String type,
      String status,
      int homeownerId,
      int? supervisorId,
      String projectAddress,
      String projectDescription,
      DateTime createdAt});
}

/// @nodoc
class __$$MonitoringResponseImplCopyWithImpl<$Res>
    extends _$MonitoringResponseCopyWithImpl<$Res, _$MonitoringResponseImpl>
    implements _$$MonitoringResponseImplCopyWith<$Res> {
  __$$MonitoringResponseImplCopyWithImpl(_$MonitoringResponseImpl _value,
      $Res Function(_$MonitoringResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? homeownerId = null,
    Object? supervisorId = freezed,
    Object? projectAddress = null,
    Object? projectDescription = null,
    Object? createdAt = null,
  }) {
    return _then(_$MonitoringResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeownerId: null == homeownerId
          ? _value.homeownerId
          : homeownerId // ignore: cast_nullable_to_non_nullable
              as int,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectAddress: null == projectAddress
          ? _value.projectAddress
          : projectAddress // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: null == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringResponseImpl implements _MonitoringResponse {
  const _$MonitoringResponseImpl(
      {required this.id,
      required this.type,
      required this.status,
      required this.homeownerId,
      this.supervisorId,
      required this.projectAddress,
      required this.projectDescription,
      required this.createdAt});

  factory _$MonitoringResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String status;
  @override
  final int homeownerId;
  @override
  final int? supervisorId;
  @override
  final String projectAddress;
  @override
  final String projectDescription;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MonitoringResponse(id: $id, type: $type, status: $status, homeownerId: $homeownerId, supervisorId: $supervisorId, projectAddress: $projectAddress, projectDescription: $projectDescription, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.homeownerId, homeownerId) ||
                other.homeownerId == homeownerId) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.projectAddress, projectAddress) ||
                other.projectAddress == projectAddress) &&
            (identical(other.projectDescription, projectDescription) ||
                other.projectDescription == projectDescription) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, status, homeownerId,
      supervisorId, projectAddress, projectDescription, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringResponseImplCopyWith<_$MonitoringResponseImpl> get copyWith =>
      __$$MonitoringResponseImplCopyWithImpl<_$MonitoringResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringResponseImplToJson(
      this,
    );
  }
}

abstract class _MonitoringResponse implements MonitoringResponse {
  const factory _MonitoringResponse(
      {required final int id,
      required final String type,
      required final String status,
      required final int homeownerId,
      final int? supervisorId,
      required final String projectAddress,
      required final String projectDescription,
      required final DateTime createdAt}) = _$MonitoringResponseImpl;

  factory _MonitoringResponse.fromJson(Map<String, dynamic> json) =
      _$MonitoringResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get status;
  @override
  int get homeownerId;
  @override
  int? get supervisorId;
  @override
  String get projectAddress;
  @override
  String get projectDescription;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringResponseImplCopyWith<_$MonitoringResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
