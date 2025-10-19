// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return _RegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponse {
  int get userId => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get ktpUrl => throw _privateConstructorUsedError;
  String? get selfieUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterResponseCopyWith<RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseCopyWith<$Res> {
  factory $RegisterResponseCopyWith(
    RegisterResponse value,
    $Res Function(RegisterResponse) then,
  ) = _$RegisterResponseCopyWithImpl<$Res, RegisterResponse>;
  @useResult
  $Res call({
    int userId,
    String? fullName,
    String email,
    String? phone,
    String? username,
    String role,
    String status,
    String? ktpUrl,
    String? selfieUrl,
  });
}

/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res, $Val extends RegisterResponse>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fullName = freezed,
    Object? email = null,
    Object? phone = freezed,
    Object? username = freezed,
    Object? role = null,
    Object? status = null,
    Object? ktpUrl = freezed,
    Object? selfieUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            ktpUrl: freezed == ktpUrl
                ? _value.ktpUrl
                : ktpUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            selfieUrl: freezed == selfieUrl
                ? _value.selfieUrl
                : selfieUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterResponseImplCopyWith<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  factory _$$RegisterResponseImplCopyWith(
    _$RegisterResponseImpl value,
    $Res Function(_$RegisterResponseImpl) then,
  ) = __$$RegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int userId,
    String? fullName,
    String email,
    String? phone,
    String? username,
    String role,
    String status,
    String? ktpUrl,
    String? selfieUrl,
  });
}

/// @nodoc
class __$$RegisterResponseImplCopyWithImpl<$Res>
    extends _$RegisterResponseCopyWithImpl<$Res, _$RegisterResponseImpl>
    implements _$$RegisterResponseImplCopyWith<$Res> {
  __$$RegisterResponseImplCopyWithImpl(
    _$RegisterResponseImpl _value,
    $Res Function(_$RegisterResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fullName = freezed,
    Object? email = null,
    Object? phone = freezed,
    Object? username = freezed,
    Object? role = null,
    Object? status = null,
    Object? ktpUrl = freezed,
    Object? selfieUrl = freezed,
  }) {
    return _then(
      _$RegisterResponseImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        ktpUrl: freezed == ktpUrl
            ? _value.ktpUrl
            : ktpUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        selfieUrl: freezed == selfieUrl
            ? _value.selfieUrl
            : selfieUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseImpl implements _RegisterResponse {
  const _$RegisterResponseImpl({
    required this.userId,
    this.fullName,
    required this.email,
    this.phone,
    this.username,
    required this.role,
    required this.status,
    this.ktpUrl,
    this.selfieUrl,
  });

  factory _$RegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseImplFromJson(json);

  @override
  final int userId;
  @override
  final String? fullName;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? username;
  @override
  final String role;
  @override
  final String status;
  @override
  final String? ktpUrl;
  @override
  final String? selfieUrl;

  @override
  String toString() {
    return 'RegisterResponse(userId: $userId, fullName: $fullName, email: $email, phone: $phone, username: $username, role: $role, status: $status, ktpUrl: $ktpUrl, selfieUrl: $selfieUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ktpUrl, ktpUrl) || other.ktpUrl == ktpUrl) &&
            (identical(other.selfieUrl, selfieUrl) ||
                other.selfieUrl == selfieUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    fullName,
    email,
    phone,
    username,
    role,
    status,
    ktpUrl,
    selfieUrl,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      __$$RegisterResponseImplCopyWithImpl<_$RegisterResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseImplToJson(this);
  }
}

abstract class _RegisterResponse implements RegisterResponse {
  const factory _RegisterResponse({
    required final int userId,
    final String? fullName,
    required final String email,
    final String? phone,
    final String? username,
    required final String role,
    required final String status,
    final String? ktpUrl,
    final String? selfieUrl,
  }) = _$RegisterResponseImpl;

  factory _RegisterResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseImpl.fromJson;

  @override
  int get userId;
  @override
  String? get fullName;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get username;
  @override
  String get role;
  @override
  String get status;
  @override
  String? get ktpUrl;
  @override
  String? get selfieUrl;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
