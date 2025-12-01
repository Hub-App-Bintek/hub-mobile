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
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  RegisterResponseData? get data => throw _privateConstructorUsedError;

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
  $Res call({bool? status, String? message, RegisterResponseData? data});

  $RegisterResponseDataCopyWith<$Res>? get data;
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
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as RegisterResponseData?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterResponseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RegisterResponseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
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
  $Res call({bool? status, String? message, RegisterResponseData? data});

  @override
  $RegisterResponseDataCopyWith<$Res>? get data;
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
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$RegisterResponseImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as RegisterResponseData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseImpl implements _RegisterResponse {
  const _$RegisterResponseImpl({this.status, this.message, this.data});

  factory _$RegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final RegisterResponseData? data;

  @override
  String toString() {
    return 'RegisterResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

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
    final bool? status,
    final String? message,
    final RegisterResponseData? data,
  }) = _$RegisterResponseImpl;

  factory _RegisterResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  RegisterResponseData? get data;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterResponseData _$RegisterResponseDataFromJson(Map<String, dynamic> json) {
  return _RegisterResponseData.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponseData {
  String? get userId => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterResponseDataCopyWith<RegisterResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseDataCopyWith<$Res> {
  factory $RegisterResponseDataCopyWith(
    RegisterResponseData value,
    $Res Function(RegisterResponseData) then,
  ) = _$RegisterResponseDataCopyWithImpl<$Res, RegisterResponseData>;
  @useResult
  $Res call({String? userId, String? verificationStatus});
}

/// @nodoc
class _$RegisterResponseDataCopyWithImpl<
  $Res,
  $Val extends RegisterResponseData
>
    implements $RegisterResponseDataCopyWith<$Res> {
  _$RegisterResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = freezed, Object? verificationStatus = freezed}) {
    return _then(
      _value.copyWith(
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationStatus: freezed == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterResponseDataImplCopyWith<$Res>
    implements $RegisterResponseDataCopyWith<$Res> {
  factory _$$RegisterResponseDataImplCopyWith(
    _$RegisterResponseDataImpl value,
    $Res Function(_$RegisterResponseDataImpl) then,
  ) = __$$RegisterResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? verificationStatus});
}

/// @nodoc
class __$$RegisterResponseDataImplCopyWithImpl<$Res>
    extends _$RegisterResponseDataCopyWithImpl<$Res, _$RegisterResponseDataImpl>
    implements _$$RegisterResponseDataImplCopyWith<$Res> {
  __$$RegisterResponseDataImplCopyWithImpl(
    _$RegisterResponseDataImpl _value,
    $Res Function(_$RegisterResponseDataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = freezed, Object? verificationStatus = freezed}) {
    return _then(
      _$RegisterResponseDataImpl(
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationStatus: freezed == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseDataImpl implements _RegisterResponseData {
  const _$RegisterResponseDataImpl({this.userId, this.verificationStatus});

  factory _$RegisterResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseDataImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? verificationStatus;

  @override
  String toString() {
    return 'RegisterResponseData(userId: $userId, verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, verificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseDataImplCopyWith<_$RegisterResponseDataImpl>
  get copyWith =>
      __$$RegisterResponseDataImplCopyWithImpl<_$RegisterResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseDataImplToJson(this);
  }
}

abstract class _RegisterResponseData implements RegisterResponseData {
  const factory _RegisterResponseData({
    final String? userId,
    final String? verificationStatus,
  }) = _$RegisterResponseDataImpl;

  factory _RegisterResponseData.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseDataImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get verificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$RegisterResponseDataImplCopyWith<_$RegisterResponseDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}
