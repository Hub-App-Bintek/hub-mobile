// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivateAccountRequest _$ActivateAccountRequestFromJson(
    Map<String, dynamic> json) {
  return _ActivateAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$ActivateAccountRequest {
  String get email => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivateAccountRequestCopyWith<ActivateAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivateAccountRequestCopyWith<$Res> {
  factory $ActivateAccountRequestCopyWith(ActivateAccountRequest value,
          $Res Function(ActivateAccountRequest) then) =
      _$ActivateAccountRequestCopyWithImpl<$Res, ActivateAccountRequest>;
  @useResult
  $Res call(
      {String email, String token, String password, String confirmPassword});
}

/// @nodoc
class _$ActivateAccountRequestCopyWithImpl<$Res,
        $Val extends ActivateAccountRequest>
    implements $ActivateAccountRequestCopyWith<$Res> {
  _$ActivateAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? token = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivateAccountRequestImplCopyWith<$Res>
    implements $ActivateAccountRequestCopyWith<$Res> {
  factory _$$ActivateAccountRequestImplCopyWith(
          _$ActivateAccountRequestImpl value,
          $Res Function(_$ActivateAccountRequestImpl) then) =
      __$$ActivateAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String token, String password, String confirmPassword});
}

/// @nodoc
class __$$ActivateAccountRequestImplCopyWithImpl<$Res>
    extends _$ActivateAccountRequestCopyWithImpl<$Res,
        _$ActivateAccountRequestImpl>
    implements _$$ActivateAccountRequestImplCopyWith<$Res> {
  __$$ActivateAccountRequestImplCopyWithImpl(
      _$ActivateAccountRequestImpl _value,
      $Res Function(_$ActivateAccountRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? token = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$ActivateAccountRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivateAccountRequestImpl implements _ActivateAccountRequest {
  const _$ActivateAccountRequestImpl(
      {required this.email,
      required this.token,
      required this.password,
      required this.confirmPassword});

  factory _$ActivateAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivateAccountRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String token;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ActivateAccountRequest(email: $email, token: $token, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateAccountRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, token, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateAccountRequestImplCopyWith<_$ActivateAccountRequestImpl>
      get copyWith => __$$ActivateAccountRequestImplCopyWithImpl<
          _$ActivateAccountRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivateAccountRequestImplToJson(
      this,
    );
  }
}

abstract class _ActivateAccountRequest implements ActivateAccountRequest {
  const factory _ActivateAccountRequest(
      {required final String email,
      required final String token,
      required final String password,
      required final String confirmPassword}) = _$ActivateAccountRequestImpl;

  factory _ActivateAccountRequest.fromJson(Map<String, dynamic> json) =
      _$ActivateAccountRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get token;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$ActivateAccountRequestImplCopyWith<_$ActivateAccountRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
