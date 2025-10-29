// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_revision_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateRevisionRequest _$CreateRevisionRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateRevisionRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateRevisionRequest {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRevisionRequestCopyWith<CreateRevisionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRevisionRequestCopyWith<$Res> {
  factory $CreateRevisionRequestCopyWith(
    CreateRevisionRequest value,
    $Res Function(CreateRevisionRequest) then,
  ) = _$CreateRevisionRequestCopyWithImpl<$Res, CreateRevisionRequest>;
  @useResult
  $Res call({String title, String description, String priority});
}

/// @nodoc
class _$CreateRevisionRequestCopyWithImpl<
  $Res,
  $Val extends CreateRevisionRequest
>
    implements $CreateRevisionRequestCopyWith<$Res> {
  _$CreateRevisionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateRevisionRequestImplCopyWith<$Res>
    implements $CreateRevisionRequestCopyWith<$Res> {
  factory _$$CreateRevisionRequestImplCopyWith(
    _$CreateRevisionRequestImpl value,
    $Res Function(_$CreateRevisionRequestImpl) then,
  ) = __$$CreateRevisionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String priority});
}

/// @nodoc
class __$$CreateRevisionRequestImplCopyWithImpl<$Res>
    extends
        _$CreateRevisionRequestCopyWithImpl<$Res, _$CreateRevisionRequestImpl>
    implements _$$CreateRevisionRequestImplCopyWith<$Res> {
  __$$CreateRevisionRequestImplCopyWithImpl(
    _$CreateRevisionRequestImpl _value,
    $Res Function(_$CreateRevisionRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
  }) {
    return _then(
      _$CreateRevisionRequestImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRevisionRequestImpl implements _CreateRevisionRequest {
  const _$CreateRevisionRequestImpl({
    required this.title,
    required this.description,
    required this.priority,
  });

  factory _$CreateRevisionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRevisionRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String priority;

  @override
  String toString() {
    return 'CreateRevisionRequest(title: $title, description: $description, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRevisionRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRevisionRequestImplCopyWith<_$CreateRevisionRequestImpl>
  get copyWith =>
      __$$CreateRevisionRequestImplCopyWithImpl<_$CreateRevisionRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRevisionRequestImplToJson(this);
  }
}

abstract class _CreateRevisionRequest implements CreateRevisionRequest {
  const factory _CreateRevisionRequest({
    required final String title,
    required final String description,
    required final String priority,
  }) = _$CreateRevisionRequestImpl;

  factory _CreateRevisionRequest.fromJson(Map<String, dynamic> json) =
      _$CreateRevisionRequestImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get priority;
  @override
  @JsonKey(ignore: true)
  _$$CreateRevisionRequestImplCopyWith<_$CreateRevisionRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
