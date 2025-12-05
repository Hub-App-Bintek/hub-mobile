// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String? get projectId => throw _privateConstructorUsedError;
  String? get projectName => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get projectStatus => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get stateDescription => throw _privateConstructorUsedError;
  ConsultationInfo? get consultationInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call({
    String? projectId,
    String? projectName,
    String? city,
    String? projectStatus,
    String? state,
    String? stateDescription,
    ConsultationInfo? consultationInfo,
  });

  $ConsultationInfoCopyWith<$Res>? get consultationInfo;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? city = freezed,
    Object? projectStatus = freezed,
    Object? state = freezed,
    Object? stateDescription = freezed,
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
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            projectStatus: freezed == projectStatus
                ? _value.projectStatus
                : projectStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            stateDescription: freezed == stateDescription
                ? _value.stateDescription
                : stateDescription // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
    _$ProjectImpl value,
    $Res Function(_$ProjectImpl) then,
  ) = __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? projectId,
    String? projectName,
    String? city,
    String? projectStatus,
    String? state,
    String? stateDescription,
    ConsultationInfo? consultationInfo,
  });

  @override
  $ConsultationInfoCopyWith<$Res>? get consultationInfo;
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
    _$ProjectImpl _value,
    $Res Function(_$ProjectImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? city = freezed,
    Object? projectStatus = freezed,
    Object? state = freezed,
    Object? stateDescription = freezed,
    Object? consultationInfo = freezed,
  }) {
    return _then(
      _$ProjectImpl(
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectName: freezed == projectName
            ? _value.projectName
            : projectName // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        projectStatus: freezed == projectStatus
            ? _value.projectStatus
            : projectStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        stateDescription: freezed == stateDescription
            ? _value.stateDescription
            : stateDescription // ignore: cast_nullable_to_non_nullable
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
class _$ProjectImpl implements _Project {
  const _$ProjectImpl({
    this.projectId,
    this.projectName,
    this.city,
    this.projectStatus,
    this.state,
    this.stateDescription,
    this.consultationInfo,
  });

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String? projectId;
  @override
  final String? projectName;
  @override
  final String? city;
  @override
  final String? projectStatus;
  @override
  final String? state;
  @override
  final String? stateDescription;
  @override
  final ConsultationInfo? consultationInfo;

  @override
  String toString() {
    return 'Project(projectId: $projectId, projectName: $projectName, city: $city, projectStatus: $projectStatus, state: $state, stateDescription: $stateDescription, consultationInfo: $consultationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.projectStatus, projectStatus) ||
                other.projectStatus == projectStatus) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateDescription, stateDescription) ||
                other.stateDescription == stateDescription) &&
            (identical(other.consultationInfo, consultationInfo) ||
                other.consultationInfo == consultationInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectId,
    projectName,
    city,
    projectStatus,
    state,
    stateDescription,
    consultationInfo,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(this);
  }
}

abstract class _Project implements Project {
  const factory _Project({
    final String? projectId,
    final String? projectName,
    final String? city,
    final String? projectStatus,
    final String? state,
    final String? stateDescription,
    final ConsultationInfo? consultationInfo,
  }) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String? get projectId;
  @override
  String? get projectName;
  @override
  String? get city;
  @override
  String? get projectStatus;
  @override
  String? get state;
  @override
  String? get stateDescription;
  @override
  ConsultationInfo? get consultationInfo;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
