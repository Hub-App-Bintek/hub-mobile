// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'construction_supervisor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConstructionSupervisorModel _$ConstructionSupervisorModelFromJson(
  Map<String, dynamic> json,
) {
  return _ConstructionSupervisorModel.fromJson(json);
}

/// @nodoc
mixin _$ConstructionSupervisorModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get availabilityStatus => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConstructionSupervisorModelCopyWith<ConstructionSupervisorModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstructionSupervisorModelCopyWith<$Res> {
  factory $ConstructionSupervisorModelCopyWith(
    ConstructionSupervisorModel value,
    $Res Function(ConstructionSupervisorModel) then,
  ) =
      _$ConstructionSupervisorModelCopyWithImpl<
        $Res,
        ConstructionSupervisorModel
      >;
  @useResult
  $Res call({
    int id,
    String name,
    String type,
    String specialization,
    double rate,
    String availabilityStatus,
    String location,
  });
}

/// @nodoc
class _$ConstructionSupervisorModelCopyWithImpl<
  $Res,
  $Val extends ConstructionSupervisorModel
>
    implements $ConstructionSupervisorModelCopyWith<$Res> {
  _$ConstructionSupervisorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? specialization = null,
    Object? rate = null,
    Object? availabilityStatus = null,
    Object? location = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
            rate: null == rate
                ? _value.rate
                : rate // ignore: cast_nullable_to_non_nullable
                      as double,
            availabilityStatus: null == availabilityStatus
                ? _value.availabilityStatus
                : availabilityStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConstructionSupervisorModelImplCopyWith<$Res>
    implements $ConstructionSupervisorModelCopyWith<$Res> {
  factory _$$ConstructionSupervisorModelImplCopyWith(
    _$ConstructionSupervisorModelImpl value,
    $Res Function(_$ConstructionSupervisorModelImpl) then,
  ) = __$$ConstructionSupervisorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String type,
    String specialization,
    double rate,
    String availabilityStatus,
    String location,
  });
}

/// @nodoc
class __$$ConstructionSupervisorModelImplCopyWithImpl<$Res>
    extends
        _$ConstructionSupervisorModelCopyWithImpl<
          $Res,
          _$ConstructionSupervisorModelImpl
        >
    implements _$$ConstructionSupervisorModelImplCopyWith<$Res> {
  __$$ConstructionSupervisorModelImplCopyWithImpl(
    _$ConstructionSupervisorModelImpl _value,
    $Res Function(_$ConstructionSupervisorModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? specialization = null,
    Object? rate = null,
    Object? availabilityStatus = null,
    Object? location = null,
  }) {
    return _then(
      _$ConstructionSupervisorModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
        rate: null == rate
            ? _value.rate
            : rate // ignore: cast_nullable_to_non_nullable
                  as double,
        availabilityStatus: null == availabilityStatus
            ? _value.availabilityStatus
            : availabilityStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstructionSupervisorModelImpl
    implements _ConstructionSupervisorModel {
  const _$ConstructionSupervisorModelImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.specialization,
    required this.rate,
    required this.availabilityStatus,
    required this.location,
  });

  factory _$ConstructionSupervisorModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ConstructionSupervisorModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String specialization;
  @override
  final double rate;
  @override
  final String availabilityStatus;
  @override
  final String location;

  @override
  String toString() {
    return 'ConstructionSupervisorModel(id: $id, name: $name, type: $type, specialization: $specialization, rate: $rate, availabilityStatus: $availabilityStatus, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstructionSupervisorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.availabilityStatus, availabilityStatus) ||
                other.availabilityStatus == availabilityStatus) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    specialization,
    rate,
    availabilityStatus,
    location,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstructionSupervisorModelImplCopyWith<_$ConstructionSupervisorModelImpl>
  get copyWith =>
      __$$ConstructionSupervisorModelImplCopyWithImpl<
        _$ConstructionSupervisorModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstructionSupervisorModelImplToJson(this);
  }
}

abstract class _ConstructionSupervisorModel
    implements ConstructionSupervisorModel {
  const factory _ConstructionSupervisorModel({
    required final int id,
    required final String name,
    required final String type,
    required final String specialization,
    required final double rate,
    required final String availabilityStatus,
    required final String location,
  }) = _$ConstructionSupervisorModelImpl;

  factory _ConstructionSupervisorModel.fromJson(Map<String, dynamic> json) =
      _$ConstructionSupervisorModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get specialization;
  @override
  double get rate;
  @override
  String get availabilityStatus;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$ConstructionSupervisorModelImplCopyWith<_$ConstructionSupervisorModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
