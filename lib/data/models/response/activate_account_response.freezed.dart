// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivateAccountResponse _$ActivateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _ActivateAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$ActivateAccountResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivateAccountResponseCopyWith<ActivateAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivateAccountResponseCopyWith<$Res> {
  factory $ActivateAccountResponseCopyWith(ActivateAccountResponse value,
          $Res Function(ActivateAccountResponse) then) =
      _$ActivateAccountResponseCopyWithImpl<$Res, ActivateAccountResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ActivateAccountResponseCopyWithImpl<$Res,
        $Val extends ActivateAccountResponse>
    implements $ActivateAccountResponseCopyWith<$Res> {
  _$ActivateAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivateAccountResponseImplCopyWith<$Res>
    implements $ActivateAccountResponseCopyWith<$Res> {
  factory _$$ActivateAccountResponseImplCopyWith(
          _$ActivateAccountResponseImpl value,
          $Res Function(_$ActivateAccountResponseImpl) then) =
      __$$ActivateAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ActivateAccountResponseImplCopyWithImpl<$Res>
    extends _$ActivateAccountResponseCopyWithImpl<$Res,
        _$ActivateAccountResponseImpl>
    implements _$$ActivateAccountResponseImplCopyWith<$Res> {
  __$$ActivateAccountResponseImplCopyWithImpl(
      _$ActivateAccountResponseImpl _value,
      $Res Function(_$ActivateAccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ActivateAccountResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivateAccountResponseImpl implements _ActivateAccountResponse {
  const _$ActivateAccountResponseImpl({required this.message});

  factory _$ActivateAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivateAccountResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'ActivateAccountResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateAccountResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateAccountResponseImplCopyWith<_$ActivateAccountResponseImpl>
      get copyWith => __$$ActivateAccountResponseImplCopyWithImpl<
          _$ActivateAccountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivateAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _ActivateAccountResponse implements ActivateAccountResponse {
  const factory _ActivateAccountResponse({required final String message}) =
      _$ActivateAccountResponseImpl;

  factory _ActivateAccountResponse.fromJson(Map<String, dynamic> json) =
      _$ActivateAccountResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ActivateAccountResponseImplCopyWith<_$ActivateAccountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
