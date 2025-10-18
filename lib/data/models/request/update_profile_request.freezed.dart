// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRequest {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get ktpNumber => throw _privateConstructorUsedError;
  String? get ktpFilePath =>
      throw _privateConstructorUsedError; // local file path or multipart
  String? get selfieFilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileRequestCopyWith<$Res> {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value,
          $Res Function(UpdateProfileRequest) then) =
      _$UpdateProfileRequestCopyWithImpl<$Res, UpdateProfileRequest>;
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
      String ktpNumber,
      String? ktpFilePath,
      String? selfieFilePath});
}

/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res,
        $Val extends UpdateProfileRequest>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? ktpNumber = null,
    Object? ktpFilePath = freezed,
    Object? selfieFilePath = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      ktpNumber: null == ktpNumber
          ? _value.ktpNumber
          : ktpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ktpFilePath: freezed == ktpFilePath
          ? _value.ktpFilePath
          : ktpFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      selfieFilePath: freezed == selfieFilePath
          ? _value.selfieFilePath
          : selfieFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProfileRequestImplCopyWith<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$$UpdateProfileRequestImplCopyWith(_$UpdateProfileRequestImpl value,
          $Res Function(_$UpdateProfileRequestImpl) then) =
      __$$UpdateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
      String ktpNumber,
      String? ktpFilePath,
      String? selfieFilePath});
}

/// @nodoc
class __$$UpdateProfileRequestImplCopyWithImpl<$Res>
    extends _$UpdateProfileRequestCopyWithImpl<$Res, _$UpdateProfileRequestImpl>
    implements _$$UpdateProfileRequestImplCopyWith<$Res> {
  __$$UpdateProfileRequestImplCopyWithImpl(_$UpdateProfileRequestImpl _value,
      $Res Function(_$UpdateProfileRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? ktpNumber = null,
    Object? ktpFilePath = freezed,
    Object? selfieFilePath = freezed,
  }) {
    return _then(_$UpdateProfileRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      ktpNumber: null == ktpNumber
          ? _value.ktpNumber
          : ktpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ktpFilePath: freezed == ktpFilePath
          ? _value.ktpFilePath
          : ktpFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      selfieFilePath: freezed == selfieFilePath
          ? _value.selfieFilePath
          : selfieFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileRequestImpl implements _UpdateProfileRequest {
  const _$UpdateProfileRequestImpl(
      {required this.name,
      required this.phone,
      required this.address,
      required this.ktpNumber,
      this.ktpFilePath,
      this.selfieFilePath});

  factory _$UpdateProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String ktpNumber;
  @override
  final String? ktpFilePath;
// local file path or multipart
  @override
  final String? selfieFilePath;

  @override
  String toString() {
    return 'UpdateProfileRequest(name: $name, phone: $phone, address: $address, ktpNumber: $ktpNumber, ktpFilePath: $ktpFilePath, selfieFilePath: $selfieFilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.ktpNumber, ktpNumber) ||
                other.ktpNumber == ktpNumber) &&
            (identical(other.ktpFilePath, ktpFilePath) ||
                other.ktpFilePath == ktpFilePath) &&
            (identical(other.selfieFilePath, selfieFilePath) ||
                other.selfieFilePath == selfieFilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, address, ktpNumber,
      ktpFilePath, selfieFilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith =>
          __$$UpdateProfileRequestImplCopyWithImpl<_$UpdateProfileRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateProfileRequest implements UpdateProfileRequest {
  const factory _UpdateProfileRequest(
      {required final String name,
      required final String phone,
      required final String address,
      required final String ktpNumber,
      final String? ktpFilePath,
      final String? selfieFilePath}) = _$UpdateProfileRequestImpl;

  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get ktpNumber;
  @override
  String? get ktpFilePath;
  @override // local file path or multipart
  String? get selfieFilePath;
  @override
  @JsonKey(ignore: true)
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
