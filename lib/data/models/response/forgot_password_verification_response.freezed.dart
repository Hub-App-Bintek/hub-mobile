// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_verification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForgotPasswordVerificationResponse _$ForgotPasswordVerificationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordVerificationResponse.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordVerificationResponse {
  String? get resetToken => throw _privateConstructorUsedError;
  int? get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordVerificationResponseCopyWith<
    ForgotPasswordVerificationResponse
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordVerificationResponseCopyWith<$Res> {
  factory $ForgotPasswordVerificationResponseCopyWith(
    ForgotPasswordVerificationResponse value,
    $Res Function(ForgotPasswordVerificationResponse) then,
  ) =
      _$ForgotPasswordVerificationResponseCopyWithImpl<
        $Res,
        ForgotPasswordVerificationResponse
      >;
  @useResult
  $Res call({String? resetToken, int? expiresIn});
}

/// @nodoc
class _$ForgotPasswordVerificationResponseCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordVerificationResponse
>
    implements $ForgotPasswordVerificationResponseCopyWith<$Res> {
  _$ForgotPasswordVerificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resetToken = freezed, Object? expiresIn = freezed}) {
    return _then(
      _value.copyWith(
            resetToken: freezed == resetToken
                ? _value.resetToken
                : resetToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiresIn: freezed == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordVerificationResponseImplCopyWith<$Res>
    implements $ForgotPasswordVerificationResponseCopyWith<$Res> {
  factory _$$ForgotPasswordVerificationResponseImplCopyWith(
    _$ForgotPasswordVerificationResponseImpl value,
    $Res Function(_$ForgotPasswordVerificationResponseImpl) then,
  ) = __$$ForgotPasswordVerificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? resetToken, int? expiresIn});
}

/// @nodoc
class __$$ForgotPasswordVerificationResponseImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordVerificationResponseCopyWithImpl<
          $Res,
          _$ForgotPasswordVerificationResponseImpl
        >
    implements _$$ForgotPasswordVerificationResponseImplCopyWith<$Res> {
  __$$ForgotPasswordVerificationResponseImplCopyWithImpl(
    _$ForgotPasswordVerificationResponseImpl _value,
    $Res Function(_$ForgotPasswordVerificationResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resetToken = freezed, Object? expiresIn = freezed}) {
    return _then(
      _$ForgotPasswordVerificationResponseImpl(
        resetToken: freezed == resetToken
            ? _value.resetToken
            : resetToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresIn: freezed == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordVerificationResponseImpl
    implements _ForgotPasswordVerificationResponse {
  const _$ForgotPasswordVerificationResponseImpl({
    this.resetToken,
    this.expiresIn,
  });

  factory _$ForgotPasswordVerificationResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ForgotPasswordVerificationResponseImplFromJson(json);

  @override
  final String? resetToken;
  @override
  final int? expiresIn;

  @override
  String toString() {
    return 'ForgotPasswordVerificationResponse(resetToken: $resetToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordVerificationResponseImpl &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resetToken, expiresIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordVerificationResponseImplCopyWith<
    _$ForgotPasswordVerificationResponseImpl
  >
  get copyWith =>
      __$$ForgotPasswordVerificationResponseImplCopyWithImpl<
        _$ForgotPasswordVerificationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordVerificationResponseImplToJson(this);
  }
}

abstract class _ForgotPasswordVerificationResponse
    implements ForgotPasswordVerificationResponse {
  const factory _ForgotPasswordVerificationResponse({
    final String? resetToken,
    final int? expiresIn,
  }) = _$ForgotPasswordVerificationResponseImpl;

  factory _ForgotPasswordVerificationResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$ForgotPasswordVerificationResponseImpl.fromJson;

  @override
  String? get resetToken;
  @override
  int? get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordVerificationResponseImplCopyWith<
    _$ForgotPasswordVerificationResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
