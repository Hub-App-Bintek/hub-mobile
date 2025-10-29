// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultant_portfolios_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultantPortfoliosResponse _$ConsultantPortfoliosResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ConsultantPortfoliosResponse.fromJson(json);
}

/// @nodoc
mixin _$ConsultantPortfoliosResponse {
  ConsultantOnPortfolios get consultant => throw _privateConstructorUsedError;
  List<Portfolio> get portfolios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultantPortfoliosResponseCopyWith<ConsultantPortfoliosResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultantPortfoliosResponseCopyWith<$Res> {
  factory $ConsultantPortfoliosResponseCopyWith(
    ConsultantPortfoliosResponse value,
    $Res Function(ConsultantPortfoliosResponse) then,
  ) =
      _$ConsultantPortfoliosResponseCopyWithImpl<
        $Res,
        ConsultantPortfoliosResponse
      >;
  @useResult
  $Res call({ConsultantOnPortfolios consultant, List<Portfolio> portfolios});

  $ConsultantOnPortfoliosCopyWith<$Res> get consultant;
}

/// @nodoc
class _$ConsultantPortfoliosResponseCopyWithImpl<
  $Res,
  $Val extends ConsultantPortfoliosResponse
>
    implements $ConsultantPortfoliosResponseCopyWith<$Res> {
  _$ConsultantPortfoliosResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? consultant = null, Object? portfolios = null}) {
    return _then(
      _value.copyWith(
            consultant: null == consultant
                ? _value.consultant
                : consultant // ignore: cast_nullable_to_non_nullable
                      as ConsultantOnPortfolios,
            portfolios: null == portfolios
                ? _value.portfolios
                : portfolios // ignore: cast_nullable_to_non_nullable
                      as List<Portfolio>,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultantOnPortfoliosCopyWith<$Res> get consultant {
    return $ConsultantOnPortfoliosCopyWith<$Res>(_value.consultant, (value) {
      return _then(_value.copyWith(consultant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultantPortfoliosResponseImplCopyWith<$Res>
    implements $ConsultantPortfoliosResponseCopyWith<$Res> {
  factory _$$ConsultantPortfoliosResponseImplCopyWith(
    _$ConsultantPortfoliosResponseImpl value,
    $Res Function(_$ConsultantPortfoliosResponseImpl) then,
  ) = __$$ConsultantPortfoliosResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConsultantOnPortfolios consultant, List<Portfolio> portfolios});

  @override
  $ConsultantOnPortfoliosCopyWith<$Res> get consultant;
}

/// @nodoc
class __$$ConsultantPortfoliosResponseImplCopyWithImpl<$Res>
    extends
        _$ConsultantPortfoliosResponseCopyWithImpl<
          $Res,
          _$ConsultantPortfoliosResponseImpl
        >
    implements _$$ConsultantPortfoliosResponseImplCopyWith<$Res> {
  __$$ConsultantPortfoliosResponseImplCopyWithImpl(
    _$ConsultantPortfoliosResponseImpl _value,
    $Res Function(_$ConsultantPortfoliosResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? consultant = null, Object? portfolios = null}) {
    return _then(
      _$ConsultantPortfoliosResponseImpl(
        consultant: null == consultant
            ? _value.consultant
            : consultant // ignore: cast_nullable_to_non_nullable
                  as ConsultantOnPortfolios,
        portfolios: null == portfolios
            ? _value._portfolios
            : portfolios // ignore: cast_nullable_to_non_nullable
                  as List<Portfolio>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultantPortfoliosResponseImpl
    implements _ConsultantPortfoliosResponse {
  const _$ConsultantPortfoliosResponseImpl({
    required this.consultant,
    required final List<Portfolio> portfolios,
  }) : _portfolios = portfolios;

  factory _$ConsultantPortfoliosResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ConsultantPortfoliosResponseImplFromJson(json);

  @override
  final ConsultantOnPortfolios consultant;
  final List<Portfolio> _portfolios;
  @override
  List<Portfolio> get portfolios {
    if (_portfolios is EqualUnmodifiableListView) return _portfolios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolios);
  }

  @override
  String toString() {
    return 'ConsultantPortfoliosResponse(consultant: $consultant, portfolios: $portfolios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultantPortfoliosResponseImpl &&
            (identical(other.consultant, consultant) ||
                other.consultant == consultant) &&
            const DeepCollectionEquality().equals(
              other._portfolios,
              _portfolios,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultant,
    const DeepCollectionEquality().hash(_portfolios),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultantPortfoliosResponseImplCopyWith<
    _$ConsultantPortfoliosResponseImpl
  >
  get copyWith =>
      __$$ConsultantPortfoliosResponseImplCopyWithImpl<
        _$ConsultantPortfoliosResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultantPortfoliosResponseImplToJson(this);
  }
}

abstract class _ConsultantPortfoliosResponse
    implements ConsultantPortfoliosResponse {
  const factory _ConsultantPortfoliosResponse({
    required final ConsultantOnPortfolios consultant,
    required final List<Portfolio> portfolios,
  }) = _$ConsultantPortfoliosResponseImpl;

  factory _ConsultantPortfoliosResponse.fromJson(Map<String, dynamic> json) =
      _$ConsultantPortfoliosResponseImpl.fromJson;

  @override
  ConsultantOnPortfolios get consultant;
  @override
  List<Portfolio> get portfolios;
  @override
  @JsonKey(ignore: true)
  _$$ConsultantPortfoliosResponseImplCopyWith<
    _$ConsultantPortfoliosResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
