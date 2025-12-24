// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_device_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterDeviceTokenRequest _$RegisterDeviceTokenRequestFromJson(
  Map<String, dynamic> json,
) {
  return _RegisterDeviceTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterDeviceTokenRequest {
  String get deviceToken => throw _privateConstructorUsedError;
  String get deviceType => throw _privateConstructorUsedError;
  String get deviceModel => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterDeviceTokenRequestCopyWith<RegisterDeviceTokenRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDeviceTokenRequestCopyWith<$Res> {
  factory $RegisterDeviceTokenRequestCopyWith(
    RegisterDeviceTokenRequest value,
    $Res Function(RegisterDeviceTokenRequest) then,
  ) =
      _$RegisterDeviceTokenRequestCopyWithImpl<
        $Res,
        RegisterDeviceTokenRequest
      >;
  @useResult
  $Res call({
    String deviceToken,
    String deviceType,
    String deviceModel,
    String appVersion,
  });
}

/// @nodoc
class _$RegisterDeviceTokenRequestCopyWithImpl<
  $Res,
  $Val extends RegisterDeviceTokenRequest
>
    implements $RegisterDeviceTokenRequestCopyWith<$Res> {
  _$RegisterDeviceTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceToken = null,
    Object? deviceType = null,
    Object? deviceModel = null,
    Object? appVersion = null,
  }) {
    return _then(
      _value.copyWith(
            deviceToken: null == deviceToken
                ? _value.deviceToken
                : deviceToken // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceType: null == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceModel: null == deviceModel
                ? _value.deviceModel
                : deviceModel // ignore: cast_nullable_to_non_nullable
                      as String,
            appVersion: null == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterDeviceTokenRequestImplCopyWith<$Res>
    implements $RegisterDeviceTokenRequestCopyWith<$Res> {
  factory _$$RegisterDeviceTokenRequestImplCopyWith(
    _$RegisterDeviceTokenRequestImpl value,
    $Res Function(_$RegisterDeviceTokenRequestImpl) then,
  ) = __$$RegisterDeviceTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deviceToken,
    String deviceType,
    String deviceModel,
    String appVersion,
  });
}

/// @nodoc
class __$$RegisterDeviceTokenRequestImplCopyWithImpl<$Res>
    extends
        _$RegisterDeviceTokenRequestCopyWithImpl<
          $Res,
          _$RegisterDeviceTokenRequestImpl
        >
    implements _$$RegisterDeviceTokenRequestImplCopyWith<$Res> {
  __$$RegisterDeviceTokenRequestImplCopyWithImpl(
    _$RegisterDeviceTokenRequestImpl _value,
    $Res Function(_$RegisterDeviceTokenRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceToken = null,
    Object? deviceType = null,
    Object? deviceModel = null,
    Object? appVersion = null,
  }) {
    return _then(
      _$RegisterDeviceTokenRequestImpl(
        deviceToken: null == deviceToken
            ? _value.deviceToken
            : deviceToken // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceType: null == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceModel: null == deviceModel
            ? _value.deviceModel
            : deviceModel // ignore: cast_nullable_to_non_nullable
                  as String,
        appVersion: null == appVersion
            ? _value.appVersion
            : appVersion // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterDeviceTokenRequestImpl implements _RegisterDeviceTokenRequest {
  const _$RegisterDeviceTokenRequestImpl({
    required this.deviceToken,
    required this.deviceType,
    required this.deviceModel,
    required this.appVersion,
  });

  factory _$RegisterDeviceTokenRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RegisterDeviceTokenRequestImplFromJson(json);

  @override
  final String deviceToken;
  @override
  final String deviceType;
  @override
  final String deviceModel;
  @override
  final String appVersion;

  @override
  String toString() {
    return 'RegisterDeviceTokenRequest(deviceToken: $deviceToken, deviceType: $deviceType, deviceModel: $deviceModel, appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDeviceTokenRequestImpl &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deviceToken,
    deviceType,
    deviceModel,
    appVersion,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDeviceTokenRequestImplCopyWith<_$RegisterDeviceTokenRequestImpl>
  get copyWith =>
      __$$RegisterDeviceTokenRequestImplCopyWithImpl<
        _$RegisterDeviceTokenRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDeviceTokenRequestImplToJson(this);
  }
}

abstract class _RegisterDeviceTokenRequest
    implements RegisterDeviceTokenRequest {
  const factory _RegisterDeviceTokenRequest({
    required final String deviceToken,
    required final String deviceType,
    required final String deviceModel,
    required final String appVersion,
  }) = _$RegisterDeviceTokenRequestImpl;

  factory _RegisterDeviceTokenRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterDeviceTokenRequestImpl.fromJson;

  @override
  String get deviceToken;
  @override
  String get deviceType;
  @override
  String get deviceModel;
  @override
  String get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$RegisterDeviceTokenRequestImplCopyWith<_$RegisterDeviceTokenRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
