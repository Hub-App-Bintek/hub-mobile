// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringItemModel _$MonitoringItemModelFromJson(Map<String, dynamic> json) {
  return _MonitoringItemModel.fromJson(json);
}

/// @nodoc
mixin _$MonitoringItemModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get supervisorName => throw _privateConstructorUsedError;
  int? get supervisorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringItemModelCopyWith<MonitoringItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringItemModelCopyWith<$Res> {
  factory $MonitoringItemModelCopyWith(
          MonitoringItemModel value, $Res Function(MonitoringItemModel) then) =
      _$MonitoringItemModelCopyWithImpl<$Res, MonitoringItemModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? supervisorName,
      int? supervisorId,
      DateTime createdAt});
}

/// @nodoc
class _$MonitoringItemModelCopyWithImpl<$Res, $Val extends MonitoringItemModel>
    implements $MonitoringItemModelCopyWith<$Res> {
  _$MonitoringItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? supervisorName = freezed,
    Object? supervisorId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringItemModelImplCopyWith<$Res>
    implements $MonitoringItemModelCopyWith<$Res> {
  factory _$$MonitoringItemModelImplCopyWith(_$MonitoringItemModelImpl value,
          $Res Function(_$MonitoringItemModelImpl) then) =
      __$$MonitoringItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? supervisorName,
      int? supervisorId,
      DateTime createdAt});
}

/// @nodoc
class __$$MonitoringItemModelImplCopyWithImpl<$Res>
    extends _$MonitoringItemModelCopyWithImpl<$Res, _$MonitoringItemModelImpl>
    implements _$$MonitoringItemModelImplCopyWith<$Res> {
  __$$MonitoringItemModelImplCopyWithImpl(_$MonitoringItemModelImpl _value,
      $Res Function(_$MonitoringItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? supervisorName = freezed,
    Object? supervisorId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$MonitoringItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorId: freezed == supervisorId
          ? _value.supervisorId
          : supervisorId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringItemModelImpl implements _MonitoringItemModel {
  const _$MonitoringItemModelImpl(
      {required this.id,
      required this.title,
      this.supervisorName,
      this.supervisorId,
      required this.createdAt});

  factory _$MonitoringItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringItemModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? supervisorName;
  @override
  final int? supervisorId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MonitoringItemModel(id: $id, title: $title, supervisorName: $supervisorName, supervisorId: $supervisorId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, supervisorName, supervisorId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringItemModelImplCopyWith<_$MonitoringItemModelImpl> get copyWith =>
      __$$MonitoringItemModelImplCopyWithImpl<_$MonitoringItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringItemModelImplToJson(
      this,
    );
  }
}

abstract class _MonitoringItemModel implements MonitoringItemModel {
  const factory _MonitoringItemModel(
      {required final int id,
      required final String title,
      final String? supervisorName,
      final int? supervisorId,
      required final DateTime createdAt}) = _$MonitoringItemModelImpl;

  factory _MonitoringItemModel.fromJson(Map<String, dynamic> json) =
      _$MonitoringItemModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get supervisorName;
  @override
  int? get supervisorId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringItemModelImplCopyWith<_$MonitoringItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
