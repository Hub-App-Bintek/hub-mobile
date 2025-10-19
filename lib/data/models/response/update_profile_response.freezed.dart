// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateProfileResponse _$UpdateProfileResponseFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProfileResponseCopyWith<UpdateProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileResponseCopyWith<$Res> {
  factory $UpdateProfileResponseCopyWith(
    UpdateProfileResponse value,
    $Res Function(UpdateProfileResponse) then,
  ) = _$UpdateProfileResponseCopyWithImpl<$Res, UpdateProfileResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UpdateProfileResponseCopyWithImpl<
  $Res,
  $Val extends UpdateProfileResponse
>
    implements $UpdateProfileResponseCopyWith<$Res> {
  _$UpdateProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateProfileResponseImplCopyWith<$Res>
    implements $UpdateProfileResponseCopyWith<$Res> {
  factory _$$UpdateProfileResponseImplCopyWith(
    _$UpdateProfileResponseImpl value,
    $Res Function(_$UpdateProfileResponseImpl) then,
  ) = __$$UpdateProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UpdateProfileResponseImplCopyWithImpl<$Res>
    extends
        _$UpdateProfileResponseCopyWithImpl<$Res, _$UpdateProfileResponseImpl>
    implements _$$UpdateProfileResponseImplCopyWith<$Res> {
  __$$UpdateProfileResponseImplCopyWithImpl(
    _$UpdateProfileResponseImpl _value,
    $Res Function(_$UpdateProfileResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UpdateProfileResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileResponseImpl implements _UpdateProfileResponse {
  const _$UpdateProfileResponseImpl({required this.message});

  factory _$UpdateProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'UpdateProfileResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileResponseImplCopyWith<_$UpdateProfileResponseImpl>
  get copyWith =>
      __$$UpdateProfileResponseImplCopyWithImpl<_$UpdateProfileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileResponseImplToJson(this);
  }
}

abstract class _UpdateProfileResponse implements UpdateProfileResponse {
  const factory _UpdateProfileResponse({required final String message}) =
      _$UpdateProfileResponseImpl;

  factory _UpdateProfileResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UpdateProfileResponseImplCopyWith<_$UpdateProfileResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
