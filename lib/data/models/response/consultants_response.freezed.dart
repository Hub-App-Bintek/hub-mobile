// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultants_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultantsResponse _$ConsultantsResponseFromJson(Map<String, dynamic> json) {
  return _ConsultantsResponse.fromJson(json);
}

/// @nodoc
mixin _$ConsultantsResponse {
  List<Consultant> get consultants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultantsResponseCopyWith<ConsultantsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultantsResponseCopyWith<$Res> {
  factory $ConsultantsResponseCopyWith(
    ConsultantsResponse value,
    $Res Function(ConsultantsResponse) then,
  ) = _$ConsultantsResponseCopyWithImpl<$Res, ConsultantsResponse>;
  @useResult
  $Res call({List<Consultant> consultants});
}

/// @nodoc
class _$ConsultantsResponseCopyWithImpl<$Res, $Val extends ConsultantsResponse>
    implements $ConsultantsResponseCopyWith<$Res> {
  _$ConsultantsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? consultants = null}) {
    return _then(
      _value.copyWith(
            consultants: null == consultants
                ? _value.consultants
                : consultants // ignore: cast_nullable_to_non_nullable
                      as List<Consultant>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultantsResponseImplCopyWith<$Res>
    implements $ConsultantsResponseCopyWith<$Res> {
  factory _$$ConsultantsResponseImplCopyWith(
    _$ConsultantsResponseImpl value,
    $Res Function(_$ConsultantsResponseImpl) then,
  ) = __$$ConsultantsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Consultant> consultants});
}

/// @nodoc
class __$$ConsultantsResponseImplCopyWithImpl<$Res>
    extends _$ConsultantsResponseCopyWithImpl<$Res, _$ConsultantsResponseImpl>
    implements _$$ConsultantsResponseImplCopyWith<$Res> {
  __$$ConsultantsResponseImplCopyWithImpl(
    _$ConsultantsResponseImpl _value,
    $Res Function(_$ConsultantsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? consultants = null}) {
    return _then(
      _$ConsultantsResponseImpl(
        consultants: null == consultants
            ? _value._consultants
            : consultants // ignore: cast_nullable_to_non_nullable
                  as List<Consultant>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultantsResponseImpl implements _ConsultantsResponse {
  const _$ConsultantsResponseImpl({required final List<Consultant> consultants})
    : _consultants = consultants;

  factory _$ConsultantsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultantsResponseImplFromJson(json);

  final List<Consultant> _consultants;
  @override
  List<Consultant> get consultants {
    if (_consultants is EqualUnmodifiableListView) return _consultants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consultants);
  }

  @override
  String toString() {
    return 'ConsultantsResponse(consultants: $consultants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultantsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._consultants,
              _consultants,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_consultants),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultantsResponseImplCopyWith<_$ConsultantsResponseImpl> get copyWith =>
      __$$ConsultantsResponseImplCopyWithImpl<_$ConsultantsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultantsResponseImplToJson(this);
  }
}

abstract class _ConsultantsResponse implements ConsultantsResponse {
  const factory _ConsultantsResponse({
    required final List<Consultant> consultants,
  }) = _$ConsultantsResponseImpl;

  factory _ConsultantsResponse.fromJson(Map<String, dynamic> json) =
      _$ConsultantsResponseImpl.fromJson;

  @override
  List<Consultant> get consultants;
  @override
  @JsonKey(ignore: true)
  _$$ConsultantsResponseImplCopyWith<_$ConsultantsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
