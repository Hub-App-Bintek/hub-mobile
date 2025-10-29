// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectLocation _$ProjectLocationFromJson(Map<String, dynamic> json) {
  return _ProjectLocation.fromJson(json);
}

/// @nodoc
mixin _$ProjectLocation {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectLocationCopyWith<ProjectLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectLocationCopyWith<$Res> {
  factory $ProjectLocationCopyWith(
    ProjectLocation value,
    $Res Function(ProjectLocation) then,
  ) = _$ProjectLocationCopyWithImpl<$Res, ProjectLocation>;
  @useResult
  $Res call({double? latitude, double? longitude, String? address});
}

/// @nodoc
class _$ProjectLocationCopyWithImpl<$Res, $Val extends ProjectLocation>
    implements $ProjectLocationCopyWith<$Res> {
  _$ProjectLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _value.copyWith(
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectLocationImplCopyWith<$Res>
    implements $ProjectLocationCopyWith<$Res> {
  factory _$$ProjectLocationImplCopyWith(
    _$ProjectLocationImpl value,
    $Res Function(_$ProjectLocationImpl) then,
  ) = __$$ProjectLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? latitude, double? longitude, String? address});
}

/// @nodoc
class __$$ProjectLocationImplCopyWithImpl<$Res>
    extends _$ProjectLocationCopyWithImpl<$Res, _$ProjectLocationImpl>
    implements _$$ProjectLocationImplCopyWith<$Res> {
  __$$ProjectLocationImplCopyWithImpl(
    _$ProjectLocationImpl _value,
    $Res Function(_$ProjectLocationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _$ProjectLocationImpl(
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectLocationImpl implements _ProjectLocation {
  const _$ProjectLocationImpl({this.latitude, this.longitude, this.address});

  factory _$ProjectLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectLocationImplFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;

  @override
  String toString() {
    return 'ProjectLocation(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectLocationImplCopyWith<_$ProjectLocationImpl> get copyWith =>
      __$$ProjectLocationImplCopyWithImpl<_$ProjectLocationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectLocationImplToJson(this);
  }
}

abstract class _ProjectLocation implements ProjectLocation {
  const factory _ProjectLocation({
    final double? latitude,
    final double? longitude,
    final String? address,
  }) = _$ProjectLocationImpl;

  factory _ProjectLocation.fromJson(Map<String, dynamic> json) =
      _$ProjectLocationImpl.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$ProjectLocationImplCopyWith<_$ProjectLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
