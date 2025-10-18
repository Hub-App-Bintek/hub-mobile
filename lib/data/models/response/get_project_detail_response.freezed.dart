// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_project_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProjectDetailResponse _$GetProjectDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _GetProjectDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProjectDetailResponse {
  Project get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProjectDetailResponseCopyWith<GetProjectDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProjectDetailResponseCopyWith<$Res> {
  factory $GetProjectDetailResponseCopyWith(GetProjectDetailResponse value,
          $Res Function(GetProjectDetailResponse) then) =
      _$GetProjectDetailResponseCopyWithImpl<$Res, GetProjectDetailResponse>;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$GetProjectDetailResponseCopyWithImpl<$Res,
        $Val extends GetProjectDetailResponse>
    implements $GetProjectDetailResponseCopyWith<$Res> {
  _$GetProjectDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetProjectDetailResponseImplCopyWith<$Res>
    implements $GetProjectDetailResponseCopyWith<$Res> {
  factory _$$GetProjectDetailResponseImplCopyWith(
          _$GetProjectDetailResponseImpl value,
          $Res Function(_$GetProjectDetailResponseImpl) then) =
      __$$GetProjectDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Project project});

  @override
  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$GetProjectDetailResponseImplCopyWithImpl<$Res>
    extends _$GetProjectDetailResponseCopyWithImpl<$Res,
        _$GetProjectDetailResponseImpl>
    implements _$$GetProjectDetailResponseImplCopyWith<$Res> {
  __$$GetProjectDetailResponseImplCopyWithImpl(
      _$GetProjectDetailResponseImpl _value,
      $Res Function(_$GetProjectDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$GetProjectDetailResponseImpl(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProjectDetailResponseImpl implements _GetProjectDetailResponse {
  const _$GetProjectDetailResponseImpl({required this.project});

  factory _$GetProjectDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProjectDetailResponseImplFromJson(json);

  @override
  final Project project;

  @override
  String toString() {
    return 'GetProjectDetailResponse(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectDetailResponseImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectDetailResponseImplCopyWith<_$GetProjectDetailResponseImpl>
      get copyWith => __$$GetProjectDetailResponseImplCopyWithImpl<
          _$GetProjectDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProjectDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _GetProjectDetailResponse implements GetProjectDetailResponse {
  const factory _GetProjectDetailResponse({required final Project project}) =
      _$GetProjectDetailResponseImpl;

  factory _GetProjectDetailResponse.fromJson(Map<String, dynamic> json) =
      _$GetProjectDetailResponseImpl.fromJson;

  @override
  Project get project;
  @override
  @JsonKey(ignore: true)
  _$$GetProjectDetailResponseImplCopyWith<_$GetProjectDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
