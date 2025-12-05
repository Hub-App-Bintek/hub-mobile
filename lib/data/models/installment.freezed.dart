// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Installment _$InstallmentFromJson(Map<String, dynamic> json) {
  return _Installment.fromJson(json);
}

/// @nodoc
mixin _$Installment {
  double? get value => throw _privateConstructorUsedError;
  bool? get percentage => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstallmentCopyWith<Installment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallmentCopyWith<$Res> {
  factory $InstallmentCopyWith(
    Installment value,
    $Res Function(Installment) then,
  ) = _$InstallmentCopyWithImpl<$Res, Installment>;
  @useResult
  $Res call({double? value, bool? percentage, String? dueDate});
}

/// @nodoc
class _$InstallmentCopyWithImpl<$Res, $Val extends Installment>
    implements $InstallmentCopyWith<$Res> {
  _$InstallmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? percentage = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentage: freezed == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InstallmentImplCopyWith<$Res>
    implements $InstallmentCopyWith<$Res> {
  factory _$$InstallmentImplCopyWith(
    _$InstallmentImpl value,
    $Res Function(_$InstallmentImpl) then,
  ) = __$$InstallmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? value, bool? percentage, String? dueDate});
}

/// @nodoc
class __$$InstallmentImplCopyWithImpl<$Res>
    extends _$InstallmentCopyWithImpl<$Res, _$InstallmentImpl>
    implements _$$InstallmentImplCopyWith<$Res> {
  __$$InstallmentImplCopyWithImpl(
    _$InstallmentImpl _value,
    $Res Function(_$InstallmentImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? percentage = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(
      _$InstallmentImpl(
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentage: freezed == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InstallmentImpl implements _Installment {
  const _$InstallmentImpl({this.value, this.percentage, this.dueDate});

  factory _$InstallmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstallmentImplFromJson(json);

  @override
  final double? value;
  @override
  final bool? percentage;
  @override
  final String? dueDate;

  @override
  String toString() {
    return 'Installment(value: $value, percentage: $percentage, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstallmentImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, percentage, dueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstallmentImplCopyWith<_$InstallmentImpl> get copyWith =>
      __$$InstallmentImplCopyWithImpl<_$InstallmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstallmentImplToJson(this);
  }
}

abstract class _Installment implements Installment {
  const factory _Installment({
    final double? value,
    final bool? percentage,
    final String? dueDate,
  }) = _$InstallmentImpl;

  factory _Installment.fromJson(Map<String, dynamic> json) =
      _$InstallmentImpl.fromJson;

  @override
  double? get value;
  @override
  bool? get percentage;
  @override
  String? get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$InstallmentImplCopyWith<_$InstallmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
