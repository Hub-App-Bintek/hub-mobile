// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_simbg_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubmitSimbgResponse _$SubmitSimbgResponseFromJson(Map<String, dynamic> json) {
  return _SubmitSimbgResponse.fromJson(json);
}

/// @nodoc
mixin _$SubmitSimbgResponse {
  String get simbgId => throw _privateConstructorUsedError;
  String get permitId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitSimbgResponseCopyWith<SubmitSimbgResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitSimbgResponseCopyWith<$Res> {
  factory $SubmitSimbgResponseCopyWith(
    SubmitSimbgResponse value,
    $Res Function(SubmitSimbgResponse) then,
  ) = _$SubmitSimbgResponseCopyWithImpl<$Res, SubmitSimbgResponse>;
  @useResult
  $Res call({String simbgId, String permitId, String status});
}

/// @nodoc
class _$SubmitSimbgResponseCopyWithImpl<$Res, $Val extends SubmitSimbgResponse>
    implements $SubmitSimbgResponseCopyWith<$Res> {
  _$SubmitSimbgResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simbgId = null,
    Object? permitId = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            simbgId: null == simbgId
                ? _value.simbgId
                : simbgId // ignore: cast_nullable_to_non_nullable
                      as String,
            permitId: null == permitId
                ? _value.permitId
                : permitId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubmitSimbgResponseImplCopyWith<$Res>
    implements $SubmitSimbgResponseCopyWith<$Res> {
  factory _$$SubmitSimbgResponseImplCopyWith(
    _$SubmitSimbgResponseImpl value,
    $Res Function(_$SubmitSimbgResponseImpl) then,
  ) = __$$SubmitSimbgResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String simbgId, String permitId, String status});
}

/// @nodoc
class __$$SubmitSimbgResponseImplCopyWithImpl<$Res>
    extends _$SubmitSimbgResponseCopyWithImpl<$Res, _$SubmitSimbgResponseImpl>
    implements _$$SubmitSimbgResponseImplCopyWith<$Res> {
  __$$SubmitSimbgResponseImplCopyWithImpl(
    _$SubmitSimbgResponseImpl _value,
    $Res Function(_$SubmitSimbgResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? simbgId = null,
    Object? permitId = null,
    Object? status = null,
  }) {
    return _then(
      _$SubmitSimbgResponseImpl(
        simbgId: null == simbgId
            ? _value.simbgId
            : simbgId // ignore: cast_nullable_to_non_nullable
                  as String,
        permitId: null == permitId
            ? _value.permitId
            : permitId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitSimbgResponseImpl implements _SubmitSimbgResponse {
  const _$SubmitSimbgResponseImpl({
    required this.simbgId,
    required this.permitId,
    required this.status,
  });

  factory _$SubmitSimbgResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitSimbgResponseImplFromJson(json);

  @override
  final String simbgId;
  @override
  final String permitId;
  @override
  final String status;

  @override
  String toString() {
    return 'SubmitSimbgResponse(simbgId: $simbgId, permitId: $permitId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitSimbgResponseImpl &&
            (identical(other.simbgId, simbgId) || other.simbgId == simbgId) &&
            (identical(other.permitId, permitId) ||
                other.permitId == permitId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, simbgId, permitId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitSimbgResponseImplCopyWith<_$SubmitSimbgResponseImpl> get copyWith =>
      __$$SubmitSimbgResponseImplCopyWithImpl<_$SubmitSimbgResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitSimbgResponseImplToJson(this);
  }
}

abstract class _SubmitSimbgResponse implements SubmitSimbgResponse {
  const factory _SubmitSimbgResponse({
    required final String simbgId,
    required final String permitId,
    required final String status,
  }) = _$SubmitSimbgResponseImpl;

  factory _SubmitSimbgResponse.fromJson(Map<String, dynamic> json) =
      _$SubmitSimbgResponseImpl.fromJson;

  @override
  String get simbgId;
  @override
  String get permitId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SubmitSimbgResponseImplCopyWith<_$SubmitSimbgResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
