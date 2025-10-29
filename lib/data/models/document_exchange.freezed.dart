// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_exchange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DocumentExchange _$DocumentExchangeFromJson(Map<String, dynamic> json) {
  return _DocumentExchange.fromJson(json);
}

/// @nodoc
mixin _$DocumentExchange {
  String? get currentDed => throw _privateConstructorUsedError;
  String? get currentBoq => throw _privateConstructorUsedError;
  String? get currentRab => throw _privateConstructorUsedError;
  List<dynamic>? get exchangeHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentExchangeCopyWith<DocumentExchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentExchangeCopyWith<$Res> {
  factory $DocumentExchangeCopyWith(
    DocumentExchange value,
    $Res Function(DocumentExchange) then,
  ) = _$DocumentExchangeCopyWithImpl<$Res, DocumentExchange>;
  @useResult
  $Res call({
    String? currentDed,
    String? currentBoq,
    String? currentRab,
    List<dynamic>? exchangeHistory,
  });
}

/// @nodoc
class _$DocumentExchangeCopyWithImpl<$Res, $Val extends DocumentExchange>
    implements $DocumentExchangeCopyWith<$Res> {
  _$DocumentExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDed = freezed,
    Object? currentBoq = freezed,
    Object? currentRab = freezed,
    Object? exchangeHistory = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentDed: freezed == currentDed
                ? _value.currentDed
                : currentDed // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentBoq: freezed == currentBoq
                ? _value.currentBoq
                : currentBoq // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentRab: freezed == currentRab
                ? _value.currentRab
                : currentRab // ignore: cast_nullable_to_non_nullable
                      as String?,
            exchangeHistory: freezed == exchangeHistory
                ? _value.exchangeHistory
                : exchangeHistory // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentExchangeImplCopyWith<$Res>
    implements $DocumentExchangeCopyWith<$Res> {
  factory _$$DocumentExchangeImplCopyWith(
    _$DocumentExchangeImpl value,
    $Res Function(_$DocumentExchangeImpl) then,
  ) = __$$DocumentExchangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? currentDed,
    String? currentBoq,
    String? currentRab,
    List<dynamic>? exchangeHistory,
  });
}

/// @nodoc
class __$$DocumentExchangeImplCopyWithImpl<$Res>
    extends _$DocumentExchangeCopyWithImpl<$Res, _$DocumentExchangeImpl>
    implements _$$DocumentExchangeImplCopyWith<$Res> {
  __$$DocumentExchangeImplCopyWithImpl(
    _$DocumentExchangeImpl _value,
    $Res Function(_$DocumentExchangeImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDed = freezed,
    Object? currentBoq = freezed,
    Object? currentRab = freezed,
    Object? exchangeHistory = freezed,
  }) {
    return _then(
      _$DocumentExchangeImpl(
        currentDed: freezed == currentDed
            ? _value.currentDed
            : currentDed // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentBoq: freezed == currentBoq
            ? _value.currentBoq
            : currentBoq // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentRab: freezed == currentRab
            ? _value.currentRab
            : currentRab // ignore: cast_nullable_to_non_nullable
                  as String?,
        exchangeHistory: freezed == exchangeHistory
            ? _value._exchangeHistory
            : exchangeHistory // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentExchangeImpl implements _DocumentExchange {
  const _$DocumentExchangeImpl({
    this.currentDed,
    this.currentBoq,
    this.currentRab,
    final List<dynamic>? exchangeHistory,
  }) : _exchangeHistory = exchangeHistory;

  factory _$DocumentExchangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentExchangeImplFromJson(json);

  @override
  final String? currentDed;
  @override
  final String? currentBoq;
  @override
  final String? currentRab;
  final List<dynamic>? _exchangeHistory;
  @override
  List<dynamic>? get exchangeHistory {
    final value = _exchangeHistory;
    if (value == null) return null;
    if (_exchangeHistory is EqualUnmodifiableListView) return _exchangeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DocumentExchange(currentDed: $currentDed, currentBoq: $currentBoq, currentRab: $currentRab, exchangeHistory: $exchangeHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentExchangeImpl &&
            (identical(other.currentDed, currentDed) ||
                other.currentDed == currentDed) &&
            (identical(other.currentBoq, currentBoq) ||
                other.currentBoq == currentBoq) &&
            (identical(other.currentRab, currentRab) ||
                other.currentRab == currentRab) &&
            const DeepCollectionEquality().equals(
              other._exchangeHistory,
              _exchangeHistory,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentDed,
    currentBoq,
    currentRab,
    const DeepCollectionEquality().hash(_exchangeHistory),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentExchangeImplCopyWith<_$DocumentExchangeImpl> get copyWith =>
      __$$DocumentExchangeImplCopyWithImpl<_$DocumentExchangeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentExchangeImplToJson(this);
  }
}

abstract class _DocumentExchange implements DocumentExchange {
  const factory _DocumentExchange({
    final String? currentDed,
    final String? currentBoq,
    final String? currentRab,
    final List<dynamic>? exchangeHistory,
  }) = _$DocumentExchangeImpl;

  factory _DocumentExchange.fromJson(Map<String, dynamic> json) =
      _$DocumentExchangeImpl.fromJson;

  @override
  String? get currentDed;
  @override
  String? get currentBoq;
  @override
  String? get currentRab;
  @override
  List<dynamic>? get exchangeHistory;
  @override
  @JsonKey(ignore: true)
  _$$DocumentExchangeImplCopyWith<_$DocumentExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
