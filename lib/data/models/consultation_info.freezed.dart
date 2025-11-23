// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultationInfo _$ConsultationInfoFromJson(Map<String, dynamic> json) {
  return _ConsultationInfo.fromJson(json);
}

/// @nodoc
mixin _$ConsultationInfo {
  int? get homeOwnerId => throw _privateConstructorUsedError;
  String? get homeOwnerName => throw _privateConstructorUsedError;
  int? get consultantId => throw _privateConstructorUsedError;
  String? get consultantName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultationInfoCopyWith<ConsultationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationInfoCopyWith<$Res> {
  factory $ConsultationInfoCopyWith(
    ConsultationInfo value,
    $Res Function(ConsultationInfo) then,
  ) = _$ConsultationInfoCopyWithImpl<$Res, ConsultationInfo>;
  @useResult
  $Res call({
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? status,
  });
}

/// @nodoc
class _$ConsultationInfoCopyWithImpl<$Res, $Val extends ConsultationInfo>
    implements $ConsultationInfoCopyWith<$Res> {
  _$ConsultationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeOwnerId = freezed,
    Object? homeOwnerName = freezed,
    Object? consultantId = freezed,
    Object? consultantName = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            homeOwnerId: freezed == homeOwnerId
                ? _value.homeOwnerId
                : homeOwnerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            homeOwnerName: freezed == homeOwnerName
                ? _value.homeOwnerName
                : homeOwnerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultantId: freezed == consultantId
                ? _value.consultantId
                : consultantId // ignore: cast_nullable_to_non_nullable
                      as int?,
            consultantName: freezed == consultantName
                ? _value.consultantName
                : consultantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultationInfoImplCopyWith<$Res>
    implements $ConsultationInfoCopyWith<$Res> {
  factory _$$ConsultationInfoImplCopyWith(
    _$ConsultationInfoImpl value,
    $Res Function(_$ConsultationInfoImpl) then,
  ) = __$$ConsultationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? homeOwnerId,
    String? homeOwnerName,
    int? consultantId,
    String? consultantName,
    String? status,
  });
}

/// @nodoc
class __$$ConsultationInfoImplCopyWithImpl<$Res>
    extends _$ConsultationInfoCopyWithImpl<$Res, _$ConsultationInfoImpl>
    implements _$$ConsultationInfoImplCopyWith<$Res> {
  __$$ConsultationInfoImplCopyWithImpl(
    _$ConsultationInfoImpl _value,
    $Res Function(_$ConsultationInfoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeOwnerId = freezed,
    Object? homeOwnerName = freezed,
    Object? consultantId = freezed,
    Object? consultantName = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$ConsultationInfoImpl(
        homeOwnerId: freezed == homeOwnerId
            ? _value.homeOwnerId
            : homeOwnerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        homeOwnerName: freezed == homeOwnerName
            ? _value.homeOwnerName
            : homeOwnerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultantId: freezed == consultantId
            ? _value.consultantId
            : consultantId // ignore: cast_nullable_to_non_nullable
                  as int?,
        consultantName: freezed == consultantName
            ? _value.consultantName
            : consultantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationInfoImpl implements _ConsultationInfo {
  const _$ConsultationInfoImpl({
    this.homeOwnerId,
    this.homeOwnerName,
    this.consultantId,
    this.consultantName,
    this.status,
  });

  factory _$ConsultationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationInfoImplFromJson(json);

  @override
  final int? homeOwnerId;
  @override
  final String? homeOwnerName;
  @override
  final int? consultantId;
  @override
  final String? consultantName;
  @override
  final String? status;

  @override
  String toString() {
    return 'ConsultationInfo(homeOwnerId: $homeOwnerId, homeOwnerName: $homeOwnerName, consultantId: $consultantId, consultantName: $consultantName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationInfoImpl &&
            (identical(other.homeOwnerId, homeOwnerId) ||
                other.homeOwnerId == homeOwnerId) &&
            (identical(other.homeOwnerName, homeOwnerName) ||
                other.homeOwnerName == homeOwnerName) &&
            (identical(other.consultantId, consultantId) ||
                other.consultantId == consultantId) &&
            (identical(other.consultantName, consultantName) ||
                other.consultantName == consultantName) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    homeOwnerId,
    homeOwnerName,
    consultantId,
    consultantName,
    status,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationInfoImplCopyWith<_$ConsultationInfoImpl> get copyWith =>
      __$$ConsultationInfoImplCopyWithImpl<_$ConsultationInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationInfoImplToJson(this);
  }
}

abstract class _ConsultationInfo implements ConsultationInfo {
  const factory _ConsultationInfo({
    final int? homeOwnerId,
    final String? homeOwnerName,
    final int? consultantId,
    final String? consultantName,
    final String? status,
  }) = _$ConsultationInfoImpl;

  factory _ConsultationInfo.fromJson(Map<String, dynamic> json) =
      _$ConsultationInfoImpl.fromJson;

  @override
  int? get homeOwnerId;
  @override
  String? get homeOwnerName;
  @override
  int? get consultantId;
  @override
  String? get consultantName;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationInfoImplCopyWith<_$ConsultationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
