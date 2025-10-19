// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Consultant _$ConsultantFromJson(Map<String, dynamic> json) {
  return _Consultant.fromJson(json);
}

/// @nodoc
mixin _$Consultant {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultantCopyWith<Consultant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultantCopyWith<$Res> {
  factory $ConsultantCopyWith(
    Consultant value,
    $Res Function(Consultant) then,
  ) = _$ConsultantCopyWithImpl<$Res, Consultant>;
  @useResult
  $Res call({
    int id,
    String name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? specialization,
    double? rating,
  });
}

/// @nodoc
class _$ConsultantCopyWithImpl<$Res, $Val extends Consultant>
    implements $ConsultantCopyWith<$Res> {
  _$ConsultantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? specialization = freezed,
    Object? rating = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialization: freezed == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultantImplCopyWith<$Res>
    implements $ConsultantCopyWith<$Res> {
  factory _$$ConsultantImplCopyWith(
    _$ConsultantImpl value,
    $Res Function(_$ConsultantImpl) then,
  ) = __$$ConsultantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? specialization,
    double? rating,
  });
}

/// @nodoc
class __$$ConsultantImplCopyWithImpl<$Res>
    extends _$ConsultantCopyWithImpl<$Res, _$ConsultantImpl>
    implements _$$ConsultantImplCopyWith<$Res> {
  __$$ConsultantImplCopyWithImpl(
    _$ConsultantImpl _value,
    $Res Function(_$ConsultantImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? specialization = freezed,
    Object? rating = freezed,
  }) {
    return _then(
      _$ConsultantImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialization: freezed == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultantImpl implements _Consultant {
  const _$ConsultantImpl({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.avatarUrl,
    this.specialization,
    this.rating,
  });

  factory _$ConsultantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultantImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? avatarUrl;
  @override
  final String? specialization;
  @override
  final double? rating;

  @override
  String toString() {
    return 'Consultant(id: $id, name: $name, email: $email, phone: $phone, avatarUrl: $avatarUrl, specialization: $specialization, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    phone,
    avatarUrl,
    specialization,
    rating,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultantImplCopyWith<_$ConsultantImpl> get copyWith =>
      __$$ConsultantImplCopyWithImpl<_$ConsultantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultantImplToJson(this);
  }
}

abstract class _Consultant implements Consultant {
  const factory _Consultant({
    required final int id,
    required final String name,
    final String? email,
    final String? phone,
    final String? avatarUrl,
    final String? specialization,
    final double? rating,
  }) = _$ConsultantImpl;

  factory _Consultant.fromJson(Map<String, dynamic> json) =
      _$ConsultantImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get avatarUrl;
  @override
  String? get specialization;
  @override
  double? get rating;
  @override
  @JsonKey(ignore: true)
  _$$ConsultantImplCopyWith<_$ConsultantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
