// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectDetailsResponse _$ProjectDetailsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectDetailsResponse {
  String? get projectId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get locationDetail => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get landArea => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Consultation? get consultation => throw _privateConstructorUsedError;
  String? get permit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDetailsResponseCopyWith<ProjectDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsResponseCopyWith<$Res> {
  factory $ProjectDetailsResponseCopyWith(
    ProjectDetailsResponse value,
    $Res Function(ProjectDetailsResponse) then,
  ) = _$ProjectDetailsResponseCopyWithImpl<$Res, ProjectDetailsResponse>;
  @useResult
  $Res call({
    String? projectId,
    String? name,
    String? type,
    String? status,
    String? locationDetail,
    double? longitude,
    double? latitude,
    double? landArea,
    DateTime? createdAt,
    DateTime? updatedAt,
    Consultation? consultation,
    String? permit,
  });

  $ConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class _$ProjectDetailsResponseCopyWithImpl<
  $Res,
  $Val extends ProjectDetailsResponse
>
    implements $ProjectDetailsResponseCopyWith<$Res> {
  _$ProjectDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? locationDetail = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? landArea = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? consultation = freezed,
    Object? permit = freezed,
  }) {
    return _then(
      _value.copyWith(
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationDetail: freezed == locationDetail
                ? _value.locationDetail
                : locationDetail // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            landArea: freezed == landArea
                ? _value.landArea
                : landArea // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            consultation: freezed == consultation
                ? _value.consultation
                : consultation // ignore: cast_nullable_to_non_nullable
                      as Consultation?,
            permit: freezed == permit
                ? _value.permit
                : permit // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultationCopyWith<$Res>? get consultation {
    if (_value.consultation == null) {
      return null;
    }

    return $ConsultationCopyWith<$Res>(_value.consultation!, (value) {
      return _then(_value.copyWith(consultation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectDetailsResponseImplCopyWith<$Res>
    implements $ProjectDetailsResponseCopyWith<$Res> {
  factory _$$ProjectDetailsResponseImplCopyWith(
    _$ProjectDetailsResponseImpl value,
    $Res Function(_$ProjectDetailsResponseImpl) then,
  ) = __$$ProjectDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? projectId,
    String? name,
    String? type,
    String? status,
    String? locationDetail,
    double? longitude,
    double? latitude,
    double? landArea,
    DateTime? createdAt,
    DateTime? updatedAt,
    Consultation? consultation,
    String? permit,
  });

  @override
  $ConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class __$$ProjectDetailsResponseImplCopyWithImpl<$Res>
    extends
        _$ProjectDetailsResponseCopyWithImpl<$Res, _$ProjectDetailsResponseImpl>
    implements _$$ProjectDetailsResponseImplCopyWith<$Res> {
  __$$ProjectDetailsResponseImplCopyWithImpl(
    _$ProjectDetailsResponseImpl _value,
    $Res Function(_$ProjectDetailsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? locationDetail = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? landArea = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? consultation = freezed,
    Object? permit = freezed,
  }) {
    return _then(
      _$ProjectDetailsResponseImpl(
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationDetail: freezed == locationDetail
            ? _value.locationDetail
            : locationDetail // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        landArea: freezed == landArea
            ? _value.landArea
            : landArea // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        consultation: freezed == consultation
            ? _value.consultation
            : consultation // ignore: cast_nullable_to_non_nullable
                  as Consultation?,
        permit: freezed == permit
            ? _value.permit
            : permit // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectDetailsResponseImpl implements _ProjectDetailsResponse {
  const _$ProjectDetailsResponseImpl({
    this.projectId,
    this.name,
    this.type,
    this.status,
    this.locationDetail,
    this.longitude,
    this.latitude,
    this.landArea,
    this.createdAt,
    this.updatedAt,
    this.consultation,
    this.permit,
  });

  factory _$ProjectDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectDetailsResponseImplFromJson(json);

  @override
  final String? projectId;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final String? locationDetail;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final double? landArea;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Consultation? consultation;
  @override
  final String? permit;

  @override
  String toString() {
    return 'ProjectDetailsResponse(projectId: $projectId, name: $name, type: $type, status: $status, locationDetail: $locationDetail, longitude: $longitude, latitude: $latitude, landArea: $landArea, createdAt: $createdAt, updatedAt: $updatedAt, consultation: $consultation, permit: $permit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsResponseImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.locationDetail, locationDetail) ||
                other.locationDetail == locationDetail) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.landArea, landArea) ||
                other.landArea == landArea) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation) &&
            (identical(other.permit, permit) || other.permit == permit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectId,
    name,
    type,
    status,
    locationDetail,
    longitude,
    latitude,
    landArea,
    createdAt,
    updatedAt,
    consultation,
    permit,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectDetailsResponseImplCopyWith<_$ProjectDetailsResponseImpl>
  get copyWith =>
      __$$ProjectDetailsResponseImplCopyWithImpl<_$ProjectDetailsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectDetailsResponseImplToJson(this);
  }
}

abstract class _ProjectDetailsResponse implements ProjectDetailsResponse {
  const factory _ProjectDetailsResponse({
    final String? projectId,
    final String? name,
    final String? type,
    final String? status,
    final String? locationDetail,
    final double? longitude,
    final double? latitude,
    final double? landArea,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final Consultation? consultation,
    final String? permit,
  }) = _$ProjectDetailsResponseImpl;

  factory _ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectDetailsResponseImpl.fromJson;

  @override
  String? get projectId;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get status;
  @override
  String? get locationDetail;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  double? get landArea;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Consultation? get consultation;
  @override
  String? get permit;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsResponseImplCopyWith<_$ProjectDetailsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
