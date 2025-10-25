// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) {
  return _VerifyOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpRequest {
  String get email => throw _privateConstructorUsedError;
  String get otpCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpRequestCopyWith<$Res> {
  factory $VerifyOtpRequestCopyWith(
    VerifyOtpRequest value,
    $Res Function(VerifyOtpRequest) then,
  ) = _$VerifyOtpRequestCopyWithImpl<$Res, VerifyOtpRequest>;
  @useResult
  $Res call({String email, String otpCode});
}

/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res, $Val extends VerifyOtpRequest>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$VerifyOtpRequestImplCopyWith<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$$VerifyOtpRequestImplCopyWith(
    _$VerifyOtpRequestImpl value,
    $Res Function(_$VerifyOtpRequestImpl) then,
  ) = __$$VerifyOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otpCode});
}

/// @nodoc
class __$$VerifyOtpRequestImplCopyWithImpl<$Res>
    extends _$VerifyOtpRequestCopyWithImpl<$Res, _$VerifyOtpRequestImpl>
    implements _$$VerifyOtpRequestImplCopyWith<$Res> {
  __$$VerifyOtpRequestImplCopyWithImpl(
    _$VerifyOtpRequestImpl _value,
    $Res Function(_$VerifyOtpRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? otpCode = null}) {
    return _then(
      _$VerifyOtpRequestImpl(
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
class _$VerifyOtpRequestImpl implements _VerifyOtpRequest {
  const _$VerifyOtpRequestImpl({required this.email, required this.otpCode});

  factory _$VerifyOtpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String otpCode;

  @override
  String toString() {
    return 'VerifyOtpRequest(email: $email, otpCode: $otpCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, otpCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestImplCopyWith<_$VerifyOtpRequestImpl> get copyWith =>
      __$$VerifyOtpRequestImplCopyWithImpl<_$VerifyOtpRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpRequestImplToJson(this);
  }
}

abstract class _VerifyOtpRequest implements VerifyOtpRequest {
  const factory _VerifyOtpRequest({
    required final String email,
    required final String otpCode,
  }) = _$VerifyOtpRequestImpl;

  factory _VerifyOtpRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get otpCode;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpRequestImplCopyWith<_$VerifyOtpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
