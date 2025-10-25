// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PortfolioResponse _$PortfolioResponseFromJson(Map<String, dynamic> json) {
  return _PortfolioResponse.fromJson(json);
}

/// @nodoc
mixin _$PortfolioResponse {
  Consultant get consultant => throw _privateConstructorUsedError;
  List<Portfolio> get portfolios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioResponseCopyWith<PortfolioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioResponseCopyWith<$Res> {
  factory $PortfolioResponseCopyWith(
          PortfolioResponse value, $Res Function(PortfolioResponse) then) =
      _$PortfolioResponseCopyWithImpl<$Res, PortfolioResponse>;
  @useResult
  $Res call({Consultant consultant, List<Portfolio> portfolios});

  $ConsultantCopyWith<$Res> get consultant;
}

/// @nodoc
class _$PortfolioResponseCopyWithImpl<$Res, $Val extends PortfolioResponse>
    implements $PortfolioResponseCopyWith<$Res> {
  _$PortfolioResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultant = null,
    Object? portfolios = null,
  }) {
    return _then(_value.copyWith(
      consultant: null == consultant
          ? _value.consultant
          : consultant // ignore: cast_nullable_to_non_nullable
              as Consultant,
      portfolios: null == portfolios
          ? _value.portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultantCopyWith<$Res> get consultant {
    return $ConsultantCopyWith<$Res>(_value.consultant, (value) {
      return _then(_value.copyWith(consultant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PortfolioResponseImplCopyWith<$Res>
    implements $PortfolioResponseCopyWith<$Res> {
  factory _$$PortfolioResponseImplCopyWith(_$PortfolioResponseImpl value,
          $Res Function(_$PortfolioResponseImpl) then) =
      __$$PortfolioResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Consultant consultant, List<Portfolio> portfolios});

  @override
  $ConsultantCopyWith<$Res> get consultant;
}

/// @nodoc
class __$$PortfolioResponseImplCopyWithImpl<$Res>
    extends _$PortfolioResponseCopyWithImpl<$Res, _$PortfolioResponseImpl>
    implements _$$PortfolioResponseImplCopyWith<$Res> {
  __$$PortfolioResponseImplCopyWithImpl(_$PortfolioResponseImpl _value,
      $Res Function(_$PortfolioResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultant = null,
    Object? portfolios = null,
  }) {
    return _then(_$PortfolioResponseImpl(
      consultant: null == consultant
          ? _value.consultant
          : consultant // ignore: cast_nullable_to_non_nullable
              as Consultant,
      portfolios: null == portfolios
          ? _value._portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioResponseImpl implements _PortfolioResponse {
  const _$PortfolioResponseImpl(
      {required this.consultant, required final List<Portfolio> portfolios})
      : _portfolios = portfolios;

  factory _$PortfolioResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioResponseImplFromJson(json);

  @override
  final Consultant consultant;
  final List<Portfolio> _portfolios;
  @override
  List<Portfolio> get portfolios {
    if (_portfolios is EqualUnmodifiableListView) return _portfolios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolios);
  }

  @override
  String toString() {
    return 'PortfolioResponse(consultant: $consultant, portfolios: $portfolios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioResponseImpl &&
            (identical(other.consultant, consultant) ||
                other.consultant == consultant) &&
            const DeepCollectionEquality()
                .equals(other._portfolios, _portfolios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, consultant,
      const DeepCollectionEquality().hash(_portfolios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioResponseImplCopyWith<_$PortfolioResponseImpl> get copyWith =>
      __$$PortfolioResponseImplCopyWithImpl<_$PortfolioResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioResponseImplToJson(
      this,
    );
  }
}

abstract class _PortfolioResponse implements PortfolioResponse {
  const factory _PortfolioResponse(
      {required final Consultant consultant,
      required final List<Portfolio> portfolios}) = _$PortfolioResponseImpl;

  factory _PortfolioResponse.fromJson(Map<String, dynamic> json) =
      _$PortfolioResponseImpl.fromJson;

  @override
  Consultant get consultant;
  @override
  List<Portfolio> get portfolios;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioResponseImplCopyWith<_$PortfolioResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
