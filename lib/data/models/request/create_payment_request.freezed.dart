// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreatePaymentRequest _$CreatePaymentRequestFromJson(Map<String, dynamic> json) {
  return _CreatePaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentRequest {
  num get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePaymentRequestCopyWith<CreatePaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentRequestCopyWith<$Res> {
  factory $CreatePaymentRequestCopyWith(
    CreatePaymentRequest value,
    $Res Function(CreatePaymentRequest) then,
  ) = _$CreatePaymentRequestCopyWithImpl<$Res, CreatePaymentRequest>;
  @useResult
  $Res call({num amount, String description, String paymentMethod});
}

/// @nodoc
class _$CreatePaymentRequestCopyWithImpl<
  $Res,
  $Val extends CreatePaymentRequest
>
    implements $CreatePaymentRequestCopyWith<$Res> {
  _$CreatePaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? paymentMethod = null,
  }) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as num,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatePaymentRequestImplCopyWith<$Res>
    implements $CreatePaymentRequestCopyWith<$Res> {
  factory _$$CreatePaymentRequestImplCopyWith(
    _$CreatePaymentRequestImpl value,
    $Res Function(_$CreatePaymentRequestImpl) then,
  ) = __$$CreatePaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num amount, String description, String paymentMethod});
}

/// @nodoc
class __$$CreatePaymentRequestImplCopyWithImpl<$Res>
    extends _$CreatePaymentRequestCopyWithImpl<$Res, _$CreatePaymentRequestImpl>
    implements _$$CreatePaymentRequestImplCopyWith<$Res> {
  __$$CreatePaymentRequestImplCopyWithImpl(
    _$CreatePaymentRequestImpl _value,
    $Res Function(_$CreatePaymentRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? description = null,
    Object? paymentMethod = null,
  }) {
    return _then(
      _$CreatePaymentRequestImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as num,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePaymentRequestImpl implements _CreatePaymentRequest {
  const _$CreatePaymentRequestImpl({
    required this.amount,
    required this.description,
    required this.paymentMethod,
  });

  factory _$CreatePaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePaymentRequestImplFromJson(json);

  @override
  final num amount;
  @override
  final String description;
  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'CreatePaymentRequest(amount: $amount, description: $description, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePaymentRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, description, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePaymentRequestImplCopyWith<_$CreatePaymentRequestImpl>
  get copyWith =>
      __$$CreatePaymentRequestImplCopyWithImpl<_$CreatePaymentRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePaymentRequestImplToJson(this);
  }
}

abstract class _CreatePaymentRequest implements CreatePaymentRequest {
  const factory _CreatePaymentRequest({
    required final num amount,
    required final String description,
    required final String paymentMethod,
  }) = _$CreatePaymentRequestImpl;

  factory _CreatePaymentRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePaymentRequestImpl.fromJson;

  @override
  num get amount;
  @override
  String get description;
  @override
  String get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$CreatePaymentRequestImplCopyWith<_$CreatePaymentRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
