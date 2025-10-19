// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateProjectResponse _$CreateProjectResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectResponse {
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateProjectResponseCopyWith<CreateProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectResponseCopyWith<$Res> {
  factory $CreateProjectResponseCopyWith(
    CreateProjectResponse value,
    $Res Function(CreateProjectResponse) then,
  ) = _$CreateProjectResponseCopyWithImpl<$Res, CreateProjectResponse>;
  @useResult
  $Res call({String projectId, String name, String type, String createdAt});
}

/// @nodoc
class _$CreateProjectResponseCopyWithImpl<
  $Res,
  $Val extends CreateProjectResponse
>
    implements $CreateProjectResponseCopyWith<$Res> {
  _$CreateProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? name = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateProjectResponseImplCopyWith<$Res>
    implements $CreateProjectResponseCopyWith<$Res> {
  factory _$$CreateProjectResponseImplCopyWith(
    _$CreateProjectResponseImpl value,
    $Res Function(_$CreateProjectResponseImpl) then,
  ) = __$$CreateProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId, String name, String type, String createdAt});
}

/// @nodoc
class __$$CreateProjectResponseImplCopyWithImpl<$Res>
    extends
        _$CreateProjectResponseCopyWithImpl<$Res, _$CreateProjectResponseImpl>
    implements _$$CreateProjectResponseImplCopyWith<$Res> {
  __$$CreateProjectResponseImplCopyWithImpl(
    _$CreateProjectResponseImpl _value,
    $Res Function(_$CreateProjectResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? name = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$CreateProjectResponseImpl(
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProjectResponseImpl implements _CreateProjectResponse {
  const _$CreateProjectResponseImpl({
    required this.projectId,
    required this.name,
    required this.type,
    required this.createdAt,
  });

  factory _$CreateProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProjectResponseImplFromJson(json);

  @override
  final String projectId;
  @override
  final String name;
  @override
  final String type;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'CreateProjectResponse(projectId: $projectId, name: $name, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectResponseImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, projectId, name, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectResponseImplCopyWith<_$CreateProjectResponseImpl>
  get copyWith =>
      __$$CreateProjectResponseImplCopyWithImpl<_$CreateProjectResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProjectResponseImplToJson(this);
  }
}

abstract class _CreateProjectResponse implements CreateProjectResponse {
  const factory _CreateProjectResponse({
    required final String projectId,
    required final String name,
    required final String type,
    required final String createdAt,
  }) = _$CreateProjectResponseImpl;

  factory _CreateProjectResponse.fromJson(Map<String, dynamic> json) =
      _$CreateProjectResponseImpl.fromJson;

  @override
  String get projectId;
  @override
  String get name;
  @override
  String get type;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CreateProjectResponseImplCopyWith<_$CreateProjectResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
