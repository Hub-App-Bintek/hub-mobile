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
  String? get projectName => throw _privateConstructorUsedError;
  String? get projectType => throw _privateConstructorUsedError;
  String? get projectStatus => throw _privateConstructorUsedError;
  String? get projectState => throw _privateConstructorUsedError;
  String? get projectStateDescription => throw _privateConstructorUsedError;
  ProjectLocation? get projectLocation => throw _privateConstructorUsedError;
  double? get landArea => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  ConsultationInfo? get consultationInfo => throw _privateConstructorUsedError;

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
    String? projectName,
    String? projectType,
    String? projectStatus,
    String? projectState,
    String? projectStateDescription,
    ProjectLocation? projectLocation,
    double? landArea,
    String? createdAt,
    String? updatedAt,
    ConsultationInfo? consultationInfo,
  });

  $ProjectLocationCopyWith<$Res>? get projectLocation;
  $ConsultationInfoCopyWith<$Res>? get consultationInfo;
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
    Object? projectName = freezed,
    Object? projectType = freezed,
    Object? projectStatus = freezed,
    Object? projectState = freezed,
    Object? projectStateDescription = freezed,
    Object? projectLocation = freezed,
    Object? landArea = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? consultationInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectName: freezed == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectType: freezed == projectType
                ? _value.projectType
                : projectType // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectStatus: freezed == projectStatus
                ? _value.projectStatus
                : projectStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectState: freezed == projectState
                ? _value.projectState
                : projectState // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectStateDescription: freezed == projectStateDescription
                ? _value.projectStateDescription
                : projectStateDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectLocation: freezed == projectLocation
                ? _value.projectLocation
                : projectLocation // ignore: cast_nullable_to_non_nullable
                      as ProjectLocation?,
            landArea: freezed == landArea
                ? _value.landArea
                : landArea // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationInfo: freezed == consultationInfo
                ? _value.consultationInfo
                : consultationInfo // ignore: cast_nullable_to_non_nullable
                      as ConsultationInfo?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectLocationCopyWith<$Res>? get projectLocation {
    if (_value.projectLocation == null) {
      return null;
    }

    return $ProjectLocationCopyWith<$Res>(_value.projectLocation!, (value) {
      return _then(_value.copyWith(projectLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultationInfoCopyWith<$Res>? get consultationInfo {
    if (_value.consultationInfo == null) {
      return null;
    }

    return $ConsultationInfoCopyWith<$Res>(_value.consultationInfo!, (value) {
      return _then(_value.copyWith(consultationInfo: value) as $Val);
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
    String? projectName,
    String? projectType,
    String? projectStatus,
    String? projectState,
    String? projectStateDescription,
    ProjectLocation? projectLocation,
    double? landArea,
    String? createdAt,
    String? updatedAt,
    ConsultationInfo? consultationInfo,
  });

  @override
  $ProjectLocationCopyWith<$Res>? get projectLocation;
  @override
  $ConsultationInfoCopyWith<$Res>? get consultationInfo;
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
    Object? projectName = freezed,
    Object? projectType = freezed,
    Object? projectStatus = freezed,
    Object? projectState = freezed,
    Object? projectStateDescription = freezed,
    Object? projectLocation = freezed,
    Object? landArea = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? consultationInfo = freezed,
  }) {
    return _then(
      _$ProjectDetailsResponseImpl(
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectName: freezed == projectName
            ? _value.projectName
            : projectName // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectType: freezed == projectType
            ? _value.projectType
            : projectType // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectStatus: freezed == projectStatus
            ? _value.projectStatus
            : projectStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectState: freezed == projectState
            ? _value.projectState
            : projectState // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectStateDescription: freezed == projectStateDescription
            ? _value.projectStateDescription
            : projectStateDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectLocation: freezed == projectLocation
            ? _value.projectLocation
            : projectLocation // ignore: cast_nullable_to_non_nullable
                  as ProjectLocation?,
        landArea: freezed == landArea
            ? _value.landArea
            : landArea // ignore: cast_nullable_to_non_nullable
                  as double?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationInfo: freezed == consultationInfo
            ? _value.consultationInfo
            : consultationInfo // ignore: cast_nullable_to_non_nullable
                  as ConsultationInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectDetailsResponseImpl implements _ProjectDetailsResponse {
  const _$ProjectDetailsResponseImpl({
    this.projectId,
    this.projectName,
    this.projectType,
    this.projectStatus,
    this.projectState,
    this.projectStateDescription,
    this.projectLocation,
    this.landArea,
    this.createdAt,
    this.updatedAt,
    this.consultationInfo,
  });

  factory _$ProjectDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectDetailsResponseImplFromJson(json);

  @override
  final String? projectId;
  @override
  final String? projectName;
  @override
  final String? projectType;
  @override
  final String? projectStatus;
  @override
  final String? projectState;
  @override
  final String? projectStateDescription;
  @override
  final ProjectLocation? projectLocation;
  @override
  final double? landArea;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final ConsultationInfo? consultationInfo;

  @override
  String toString() {
    return 'ProjectDetailsResponse(projectId: $projectId, projectName: $projectName, projectType: $projectType, projectStatus: $projectStatus, projectState: $projectState, projectStateDescription: $projectStateDescription, projectLocation: $projectLocation, landArea: $landArea, createdAt: $createdAt, updatedAt: $updatedAt, consultationInfo: $consultationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsResponseImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.projectStatus, projectStatus) ||
                other.projectStatus == projectStatus) &&
            (identical(other.projectState, projectState) ||
                other.projectState == projectState) &&
            (identical(
                  other.projectStateDescription,
                  projectStateDescription,
                ) ||
                other.projectStateDescription == projectStateDescription) &&
            (identical(other.projectLocation, projectLocation) ||
                other.projectLocation == projectLocation) &&
            (identical(other.landArea, landArea) ||
                other.landArea == landArea) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.consultationInfo, consultationInfo) ||
                other.consultationInfo == consultationInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectId,
    projectName,
    projectType,
    projectStatus,
    projectState,
    projectStateDescription,
    projectLocation,
    landArea,
    createdAt,
    updatedAt,
    consultationInfo,
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
    final String? projectName,
    final String? projectType,
    final String? projectStatus,
    final String? projectState,
    final String? projectStateDescription,
    final ProjectLocation? projectLocation,
    final double? landArea,
    final String? createdAt,
    final String? updatedAt,
    final ConsultationInfo? consultationInfo,
  }) = _$ProjectDetailsResponseImpl;

  factory _ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectDetailsResponseImpl.fromJson;

  @override
  String? get projectId;
  @override
  String? get projectName;
  @override
  String? get projectType;
  @override
  String? get projectStatus;
  @override
  String? get projectState;
  @override
  String? get projectStateDescription;
  @override
  ProjectLocation? get projectLocation;
  @override
  double? get landArea;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  ConsultationInfo? get consultationInfo;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsResponseImplCopyWith<_$ProjectDetailsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
