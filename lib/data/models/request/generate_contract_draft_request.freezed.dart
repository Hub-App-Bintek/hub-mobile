// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_contract_draft_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateContractDraftRequest _$GenerateContractDraftRequestFromJson(
  Map<String, dynamic> json,
) {
  return _GenerateContractDraftRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateContractDraftRequest {
  double get contractValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateContractDraftRequestCopyWith<GenerateContractDraftRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateContractDraftRequestCopyWith<$Res> {
  factory $GenerateContractDraftRequestCopyWith(
    GenerateContractDraftRequest value,
    $Res Function(GenerateContractDraftRequest) then,
  ) =
      _$GenerateContractDraftRequestCopyWithImpl<
        $Res,
        GenerateContractDraftRequest
      >;
  @useResult
  $Res call({double contractValue});
}

/// @nodoc
class _$GenerateContractDraftRequestCopyWithImpl<
  $Res,
  $Val extends GenerateContractDraftRequest
>
    implements $GenerateContractDraftRequestCopyWith<$Res> {
  _$GenerateContractDraftRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contractValue = null}) {
    return _then(
      _value.copyWith(
            contractValue: null == contractValue
                ? _value.contractValue
                : contractValue // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerateContractDraftRequestImplCopyWith<$Res>
    implements $GenerateContractDraftRequestCopyWith<$Res> {
  factory _$$GenerateContractDraftRequestImplCopyWith(
    _$GenerateContractDraftRequestImpl value,
    $Res Function(_$GenerateContractDraftRequestImpl) then,
  ) = __$$GenerateContractDraftRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double contractValue});
}

/// @nodoc
class __$$GenerateContractDraftRequestImplCopyWithImpl<$Res>
    extends
        _$GenerateContractDraftRequestCopyWithImpl<
          $Res,
          _$GenerateContractDraftRequestImpl
        >
    implements _$$GenerateContractDraftRequestImplCopyWith<$Res> {
  __$$GenerateContractDraftRequestImplCopyWithImpl(
    _$GenerateContractDraftRequestImpl _value,
    $Res Function(_$GenerateContractDraftRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? contractValue = null}) {
    return _then(
      _$GenerateContractDraftRequestImpl(
        contractValue: null == contractValue
            ? _value.contractValue
            : contractValue // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateContractDraftRequestImpl
    implements _GenerateContractDraftRequest {
  const _$GenerateContractDraftRequestImpl({required this.contractValue});

  factory _$GenerateContractDraftRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateContractDraftRequestImplFromJson(json);

  @override
  final double contractValue;

  @override
  String toString() {
    return 'GenerateContractDraftRequest(contractValue: $contractValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateContractDraftRequestImpl &&
            (identical(other.contractValue, contractValue) ||
                other.contractValue == contractValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contractValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateContractDraftRequestImplCopyWith<
    _$GenerateContractDraftRequestImpl
  >
  get copyWith =>
      __$$GenerateContractDraftRequestImplCopyWithImpl<
        _$GenerateContractDraftRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateContractDraftRequestImplToJson(this);
  }
}

abstract class _GenerateContractDraftRequest
    implements GenerateContractDraftRequest {
  const factory _GenerateContractDraftRequest({
    required final double contractValue,
  }) = _$GenerateContractDraftRequestImpl;

  factory _GenerateContractDraftRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateContractDraftRequestImpl.fromJson;

  @override
  double get contractValue;
  @override
  @JsonKey(ignore: true)
  _$$GenerateContractDraftRequestImplCopyWith<
    _$GenerateContractDraftRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
