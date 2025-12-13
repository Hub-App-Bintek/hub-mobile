// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_projects_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GetProjectsRequest _$GetProjectsRequestFromJson(Map<String, dynamic> json) {
  return _GetProjectsRequest.fromJson(json);
}

/// @nodoc
mixin _$GetProjectsRequest {
  int? get page => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetProjectsRequestCopyWith<GetProjectsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProjectsRequestCopyWith<$Res> {
  factory $GetProjectsRequestCopyWith(
    GetProjectsRequest value,
    $Res Function(GetProjectsRequest) then,
  ) = _$GetProjectsRequestCopyWithImpl<$Res, GetProjectsRequest>;
  @useResult
  $Res call({int? page, int? size, String? type, String? status});
}

/// @nodoc
class _$GetProjectsRequestCopyWithImpl<$Res, $Val extends GetProjectsRequest>
    implements $GetProjectsRequestCopyWith<$Res> {
  _$GetProjectsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            page: freezed == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GetProjectsRequestImplCopyWith<$Res>
    implements $GetProjectsRequestCopyWith<$Res> {
  factory _$$GetProjectsRequestImplCopyWith(
    _$GetProjectsRequestImpl value,
    $Res Function(_$GetProjectsRequestImpl) then,
  ) = __$$GetProjectsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? size, String? type, String? status});
}

/// @nodoc
class __$$GetProjectsRequestImplCopyWithImpl<$Res>
    extends _$GetProjectsRequestCopyWithImpl<$Res, _$GetProjectsRequestImpl>
    implements _$$GetProjectsRequestImplCopyWith<$Res> {
  __$$GetProjectsRequestImplCopyWithImpl(
    _$GetProjectsRequestImpl _value,
    $Res Function(_$GetProjectsRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$GetProjectsRequestImpl(
        page: freezed == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
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
class _$GetProjectsRequestImpl implements _GetProjectsRequest {
  const _$GetProjectsRequestImpl({
    this.page,
    this.size,
    this.type,
    this.status,
  });

  factory _$GetProjectsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProjectsRequestImplFromJson(json);

  @override
  final int? page;
  @override
  final int? size;
  @override
  final String? type;
  @override
  final String? status;

  @override
  String toString() {
    return 'GetProjectsRequest(page: $page, size: $size, type: $type, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsRequestImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, type, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsRequestImplCopyWith<_$GetProjectsRequestImpl> get copyWith =>
      __$$GetProjectsRequestImplCopyWithImpl<_$GetProjectsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProjectsRequestImplToJson(this);
  }
}

abstract class _GetProjectsRequest implements GetProjectsRequest {
  const factory _GetProjectsRequest({
    final int? page,
    final int? size,
    final String? type,
    final String? status,
  }) = _$GetProjectsRequestImpl;

  factory _GetProjectsRequest.fromJson(Map<String, dynamic> json) =
      _$GetProjectsRequestImpl.fromJson;

  @override
  int? get page;
  @override
  int? get size;
  @override
  String? get type;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$GetProjectsRequestImplCopyWith<_$GetProjectsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
