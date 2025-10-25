// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_projects_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GetProjectsResponse _$GetProjectsResponseFromJson(Map<String, dynamic> json) {
  return _GetProjectsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetProjectsResponse {
  List<Project> get projects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProjectsResponseCopyWith<GetProjectsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProjectsResponseCopyWith<$Res> {
  factory $GetProjectsResponseCopyWith(
    GetProjectsResponse value,
    $Res Function(GetProjectsResponse) then,
  ) = _$GetProjectsResponseCopyWithImpl<$Res, GetProjectsResponse>;
  @useResult
  $Res call({List<Project> projects});
}

/// @nodoc
class _$GetProjectsResponseCopyWithImpl<$Res, $Val extends GetProjectsResponse>
    implements $GetProjectsResponseCopyWith<$Res> {
  _$GetProjectsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? projects = null}) {
    return _then(
      _value.copyWith(
            projects: null == projects
                ? _value.projects
                : projects // ignore: cast_nullable_to_non_nullable
                      as List<Project>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProjectsResponseImplCopyWith<$Res>
    implements $GetProjectsResponseCopyWith<$Res> {
  factory _$$GetProjectsResponseImplCopyWith(
    _$GetProjectsResponseImpl value,
    $Res Function(_$GetProjectsResponseImpl) then,
  ) = __$$GetProjectsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Project> projects});
}

/// @nodoc
class __$$GetProjectsResponseImplCopyWithImpl<$Res>
    extends _$GetProjectsResponseCopyWithImpl<$Res, _$GetProjectsResponseImpl>
    implements _$$GetProjectsResponseImplCopyWith<$Res> {
  __$$GetProjectsResponseImplCopyWithImpl(
    _$GetProjectsResponseImpl _value,
    $Res Function(_$GetProjectsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? projects = null}) {
    return _then(
      _$GetProjectsResponseImpl(
        projects: null == projects
            ? _value._projects
            : projects // ignore: cast_nullable_to_non_nullable
                  as List<Project>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProjectsResponseImpl implements _GetProjectsResponse {
  const _$GetProjectsResponseImpl({required final List<Project> projects})
    : _projects = projects;

  factory _$GetProjectsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProjectsResponseImplFromJson(json);

  final List<Project> _projects;
  @override
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'GetProjectsResponse(projects: $projects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsResponseImpl &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsResponseImplCopyWith<_$GetProjectsResponseImpl> get copyWith =>
      __$$GetProjectsResponseImplCopyWithImpl<_$GetProjectsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProjectsResponseImplToJson(this);
  }
}

abstract class _GetProjectsResponse implements GetProjectsResponse {
  const factory _GetProjectsResponse({required final List<Project> projects}) =
      _$GetProjectsResponseImpl;

  factory _GetProjectsResponse.fromJson(Map<String, dynamic> json) =
      _$GetProjectsResponseImpl.fromJson;

  @override
  List<Project> get projects;
  @override
  @JsonKey(ignore: true)
  _$$GetProjectsResponseImplCopyWith<_$GetProjectsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
