// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_forgot_password_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifyForgotPasswordOtpRequest _$VerifyForgotPasswordOtpRequestFromJson(
  Map<String, dynamic> json,
) {
  return _VerifyForgotPasswordOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyForgotPasswordOtpRequest {
  String get email => throw _privateConstructorUsedError;
  String get otpCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyForgotPasswordOtpRequestCopyWith<VerifyForgotPasswordOtpRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyForgotPasswordOtpRequestCopyWith<$Res> {
  factory $VerifyForgotPasswordOtpRequestCopyWith(
    VerifyForgotPasswordOtpRequest value,
    $Res Function(VerifyForgotPasswordOtpRequest) then,
  ) =
      _$VerifyForgotPasswordOtpRequestCopyWithImpl<
        $Res,
        VerifyForgotPasswordOtpRequest
      >;
  @useResult
  $Res call({String email, String otpCode});
}

/// @nodoc
class _$VerifyForgotPasswordOtpRequestCopyWithImpl<
  $Res,
  $Val extends VerifyForgotPasswordOtpRequest
>
    implements $VerifyForgotPasswordOtpRequestCopyWith<$Res> {
  _$VerifyForgotPasswordOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? otpCode = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            otpCode: null == otpCode
                ? _value.otpCode
                : otpCode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyForgotPasswordOtpRequestImplCopyWith<$Res>
    implements $VerifyForgotPasswordOtpRequestCopyWith<$Res> {
  factory _$$VerifyForgotPasswordOtpRequestImplCopyWith(
    _$VerifyForgotPasswordOtpRequestImpl value,
    $Res Function(_$VerifyForgotPasswordOtpRequestImpl) then,
  ) = __$$VerifyForgotPasswordOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otpCode});
}

/// @nodoc
class __$$VerifyForgotPasswordOtpRequestImplCopyWithImpl<$Res>
    extends
        _$VerifyForgotPasswordOtpRequestCopyWithImpl<
          $Res,
          _$VerifyForgotPasswordOtpRequestImpl
        >
    implements _$$VerifyForgotPasswordOtpRequestImplCopyWith<$Res> {
  __$$VerifyForgotPasswordOtpRequestImplCopyWithImpl(
    _$VerifyForgotPasswordOtpRequestImpl _value,
    $Res Function(_$VerifyForgotPasswordOtpRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? otpCode = null}) {
    return _then(
      _$VerifyForgotPasswordOtpRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        otpCode: null == otpCode
            ? _value.otpCode
            : otpCode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyForgotPasswordOtpRequestImpl
    implements _VerifyForgotPasswordOtpRequest {
  const _$VerifyForgotPasswordOtpRequestImpl({
    required this.email,
    required this.otpCode,
  });

  factory _$VerifyForgotPasswordOtpRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$VerifyForgotPasswordOtpRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String otpCode;

  @override
  String toString() {
    return 'VerifyForgotPasswordOtpRequest(email: $email, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyForgotPasswordOtpRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, otpCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyForgotPasswordOtpRequestImplCopyWith<
    _$VerifyForgotPasswordOtpRequestImpl
  >
  get copyWith =>
      __$$VerifyForgotPasswordOtpRequestImplCopyWithImpl<
        _$VerifyForgotPasswordOtpRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyForgotPasswordOtpRequestImplToJson(this);
  }
}

abstract class _VerifyForgotPasswordOtpRequest
    implements VerifyForgotPasswordOtpRequest {
  const factory _VerifyForgotPasswordOtpRequest({
    required final String email,
    required final String otpCode,
  }) = _$VerifyForgotPasswordOtpRequestImpl;

  factory _VerifyForgotPasswordOtpRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyForgotPasswordOtpRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get otpCode;
  @override
  @JsonKey(ignore: true)
  _$$VerifyForgotPasswordOtpRequestImplCopyWith<
    _$VerifyForgotPasswordOtpRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
