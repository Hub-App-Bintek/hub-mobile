// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateProjectRequest _$CreateProjectRequestFromJson(Map<String, dynamic> json) {
  return _CreateProjectRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectRequest {
  String get name => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get locationDetail => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'PROTOTYPE' or 'NON_PROTOTYPE'
  double get landArea => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateProjectRequestCopyWith<CreateProjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectRequestCopyWith<$Res> {
  factory $CreateProjectRequestCopyWith(
    CreateProjectRequest value,
    $Res Function(CreateProjectRequest) then,
  ) = _$CreateProjectRequestCopyWithImpl<$Res, CreateProjectRequest>;
  @useResult
  $Res call({
    String name,
    double longitude,
    double latitude,
    String locationDetail,
    String type,
    double landArea,
    double income,
  });
}

/// @nodoc
class _$CreateProjectRequestCopyWithImpl<
  $Res,
  $Val extends CreateProjectRequest
>
    implements $CreateProjectRequestCopyWith<$Res> {
  _$CreateProjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? locationDetail = null,
    Object? type = null,
    Object? landArea = null,
    Object? income = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            locationDetail: null == locationDetail
                ? _value.locationDetail
                : locationDetail // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            landArea: null == landArea
                ? _value.landArea
                : landArea // ignore: cast_nullable_to_non_nullable
                      as double,
            income: null == income
                ? _value.income
                : income // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateProjectRequestImplCopyWith<$Res>
    implements $CreateProjectRequestCopyWith<$Res> {
  factory _$$CreateProjectRequestImplCopyWith(
    _$CreateProjectRequestImpl value,
    $Res Function(_$CreateProjectRequestImpl) then,
  ) = __$$CreateProjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double longitude,
    double latitude,
    String locationDetail,
    String type,
    double landArea,
    double income,
  });
}

/// @nodoc
class __$$CreateProjectRequestImplCopyWithImpl<$Res>
    extends _$CreateProjectRequestCopyWithImpl<$Res, _$CreateProjectRequestImpl>
    implements _$$CreateProjectRequestImplCopyWith<$Res> {
  __$$CreateProjectRequestImplCopyWithImpl(
    _$CreateProjectRequestImpl _value,
    $Res Function(_$CreateProjectRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? locationDetail = null,
    Object? type = null,
    Object? landArea = null,
    Object? income = null,
  }) {
    return _then(
      _$CreateProjectRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        locationDetail: null == locationDetail
            ? _value.locationDetail
            : locationDetail // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        landArea: null == landArea
            ? _value.landArea
            : landArea // ignore: cast_nullable_to_non_nullable
                  as double,
        income: null == income
            ? _value.income
            : income // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProjectRequestImpl implements _CreateProjectRequest {
  const _$CreateProjectRequestImpl({
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.locationDetail,
    required this.type,
    required this.landArea,
    required this.income,
  });

  factory _$CreateProjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProjectRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String locationDetail;
  @override
  final String type;
  // 'PROTOTYPE' or 'NON_PROTOTYPE'
  @override
  final double landArea;
  @override
  final double income;

  @override
  String toString() {
    return 'CreateProjectRequest(name: $name, longitude: $longitude, latitude: $latitude, locationDetail: $locationDetail, type: $type, landArea: $landArea, income: $income)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.locationDetail, locationDetail) ||
                other.locationDetail == locationDetail) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.landArea, landArea) ||
                other.landArea == landArea) &&
            (identical(other.income, income) || other.income == income));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    longitude,
    latitude,
    locationDetail,
    type,
    landArea,
    income,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectRequestImplCopyWith<_$CreateProjectRequestImpl>
  get copyWith =>
      __$$CreateProjectRequestImplCopyWithImpl<_$CreateProjectRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProjectRequestImplToJson(this);
  }
}

abstract class _CreateProjectRequest implements CreateProjectRequest {
  const factory _CreateProjectRequest({
    required final String name,
    required final double longitude,
    required final double latitude,
    required final String locationDetail,
    required final String type,
    required final double landArea,
    required final double income,
  }) = _$CreateProjectRequestImpl;

  factory _CreateProjectRequest.fromJson(Map<String, dynamic> json) =
      _$CreateProjectRequestImpl.fromJson;

  @override
  String get name;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get locationDetail;
  @override
  String get type;
  @override // 'PROTOTYPE' or 'NON_PROTOTYPE'
  double get landArea;
  @override
  double get income;
  @override
  @JsonKey(ignore: true)
  _$$CreateProjectRequestImplCopyWith<_$CreateProjectRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
