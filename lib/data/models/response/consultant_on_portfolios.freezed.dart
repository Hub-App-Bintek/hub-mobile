// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultant_on_portfolios.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultantOnPortfolios _$ConsultantOnPortfoliosFromJson(
  Map<String, dynamic> json,
) {
  return _ConsultantOnPortfolios.fromJson(json);
}

/// @nodoc
mixin _$ConsultantOnPortfolios {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultantOnPortfoliosCopyWith<ConsultantOnPortfolios> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultantOnPortfoliosCopyWith<$Res> {
  factory $ConsultantOnPortfoliosCopyWith(
    ConsultantOnPortfolios value,
    $Res Function(ConsultantOnPortfolios) then,
  ) = _$ConsultantOnPortfoliosCopyWithImpl<$Res, ConsultantOnPortfolios>;
  @useResult
  $Res call({int? id, String? name, String? email, String? specialization});
}

/// @nodoc
class _$ConsultantOnPortfoliosCopyWithImpl<
  $Res,
  $Val extends ConsultantOnPortfolios
>
    implements $ConsultantOnPortfoliosCopyWith<$Res> {
  _$ConsultantOnPortfoliosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? specialization = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialization: freezed == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultantOnPortfoliosImplCopyWith<$Res>
    implements $ConsultantOnPortfoliosCopyWith<$Res> {
  factory _$$ConsultantOnPortfoliosImplCopyWith(
    _$ConsultantOnPortfoliosImpl value,
    $Res Function(_$ConsultantOnPortfoliosImpl) then,
  ) = __$$ConsultantOnPortfoliosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? email, String? specialization});
}

/// @nodoc
class __$$ConsultantOnPortfoliosImplCopyWithImpl<$Res>
    extends
        _$ConsultantOnPortfoliosCopyWithImpl<$Res, _$ConsultantOnPortfoliosImpl>
    implements _$$ConsultantOnPortfoliosImplCopyWith<$Res> {
  __$$ConsultantOnPortfoliosImplCopyWithImpl(
    _$ConsultantOnPortfoliosImpl _value,
    $Res Function(_$ConsultantOnPortfoliosImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? specialization = freezed,
  }) {
    return _then(
      _$ConsultantOnPortfoliosImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialization: freezed == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultantOnPortfoliosImpl implements _ConsultantOnPortfolios {
  const _$ConsultantOnPortfoliosImpl({
    required this.id,
    required this.name,
    required this.email,
    required this.specialization,
  });

  factory _$ConsultantOnPortfoliosImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultantOnPortfoliosImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? specialization;

  @override
  String toString() {
    return 'ConsultantOnPortfolios(id: $id, name: $name, email: $email, specialization: $specialization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultantOnPortfoliosImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, specialization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultantOnPortfoliosImplCopyWith<_$ConsultantOnPortfoliosImpl>
  get copyWith =>
      __$$ConsultantOnPortfoliosImplCopyWithImpl<_$ConsultantOnPortfoliosImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultantOnPortfoliosImplToJson(this);
  }
}

abstract class _ConsultantOnPortfolios implements ConsultantOnPortfolios {
  const factory _ConsultantOnPortfolios({
    required final int? id,
    required final String? name,
    required final String? email,
    required final String? specialization,
  }) = _$ConsultantOnPortfoliosImpl;

  factory _ConsultantOnPortfolios.fromJson(Map<String, dynamic> json) =
      _$ConsultantOnPortfoliosImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get specialization;
  @override
  @JsonKey(ignore: true)
  _$$ConsultantOnPortfoliosImplCopyWith<_$ConsultantOnPortfoliosImpl>
  get copyWith => throw _privateConstructorUsedError;
}
