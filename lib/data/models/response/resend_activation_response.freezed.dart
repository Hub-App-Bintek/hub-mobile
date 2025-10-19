// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_activation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResendActivationResponse _$ResendActivationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ResendActivationResponse.fromJson(json);
}

/// @nodoc
mixin _$ResendActivationResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResendActivationResponseCopyWith<ResendActivationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendActivationResponseCopyWith<$Res> {
  factory $ResendActivationResponseCopyWith(
    ResendActivationResponse value,
    $Res Function(ResendActivationResponse) then,
  ) = _$ResendActivationResponseCopyWithImpl<$Res, ResendActivationResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ResendActivationResponseCopyWithImpl<
  $Res,
  $Val extends ResendActivationResponse
>
    implements $ResendActivationResponseCopyWith<$Res> {
  _$ResendActivationResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$ResendActivationResponseImplCopyWith<$Res>
    implements $ResendActivationResponseCopyWith<$Res> {
  factory _$$ResendActivationResponseImplCopyWith(
    _$ResendActivationResponseImpl value,
    $Res Function(_$ResendActivationResponseImpl) then,
  ) = __$$ResendActivationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ResendActivationResponseImplCopyWithImpl<$Res>
    extends
        _$ResendActivationResponseCopyWithImpl<
          $Res,
          _$ResendActivationResponseImpl
        >
    implements _$$ResendActivationResponseImplCopyWith<$Res> {
  __$$ResendActivationResponseImplCopyWithImpl(
    _$ResendActivationResponseImpl _value,
    $Res Function(_$ResendActivationResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ResendActivationResponseImpl(
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
class _$ResendActivationResponseImpl implements _ResendActivationResponse {
  const _$ResendActivationResponseImpl({required this.message});

  factory _$ResendActivationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendActivationResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'ResendActivationResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendActivationResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendActivationResponseImplCopyWith<_$ResendActivationResponseImpl>
  get copyWith =>
      __$$ResendActivationResponseImplCopyWithImpl<
        _$ResendActivationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendActivationResponseImplToJson(this);
  }
}

abstract class _ResendActivationResponse implements ResendActivationResponse {
  const factory _ResendActivationResponse({required final String message}) =
      _$ResendActivationResponseImpl;

  factory _ResendActivationResponse.fromJson(Map<String, dynamic> json) =
      _$ResendActivationResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ResendActivationResponseImplCopyWith<_$ResendActivationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
