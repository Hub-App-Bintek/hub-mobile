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
  PaginationMeta? get pagination => throw _privateConstructorUsedError;

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
  $Res call({List<Consultant> consultants, PaginationMeta? pagination});

  $PaginationMetaCopyWith<$Res>? get pagination;
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
  $Res call({Object? consultants = null, Object? pagination = freezed}) {
    return _then(
      _value.copyWith(
            consultants: null == consultants
                ? _value.consultants
                : consultants // ignore: cast_nullable_to_non_nullable
                      as List<Consultant>,
            pagination: freezed == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as PaginationMeta?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationMetaCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
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
  $Res call({List<Consultant> consultants, PaginationMeta? pagination});

  @override
  $PaginationMetaCopyWith<$Res>? get pagination;
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
  $Res call({Object? consultants = null, Object? pagination = freezed}) {
    return _then(
      _$ConsultantsResponseImpl(
        consultants: null == consultants
            ? _value._consultants
            : consultants // ignore: cast_nullable_to_non_nullable
                  as List<Consultant>,
        pagination: freezed == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as PaginationMeta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultantsResponseImpl implements _ConsultantsResponse {
  const _$ConsultantsResponseImpl({
    required final List<Consultant> consultants,
    this.pagination,
  }) : _consultants = consultants;

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
  final PaginationMeta? pagination;

  @override
  String toString() {
    return 'ConsultantsResponse(consultants: $consultants, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultantsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._consultants,
              _consultants,
            ) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_consultants),
    pagination,
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
    final PaginationMeta? pagination,
  }) = _$ConsultantsResponseImpl;

  factory _ConsultantsResponse.fromJson(Map<String, dynamic> json) =
      _$ConsultantsResponseImpl.fromJson;

  @override
  List<Consultant> get consultants;
  @override
  PaginationMeta? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$ConsultantsResponseImplCopyWith<_$ConsultantsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
    PaginationMeta value,
    $Res Function(PaginationMeta) then,
  ) = _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call({int total, int page, int size});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? page = null, Object? size = null}) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(
    _$PaginationMetaImpl value,
    $Res Function(_$PaginationMetaImpl) then,
  ) = __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int page, int size});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
    _$PaginationMetaImpl _value,
    $Res Function(_$PaginationMetaImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? page = null, Object? size = null}) {
    return _then(
      _$PaginationMetaImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl({
    required this.total,
    required this.page,
    required this.size,
  });

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  final int total;
  @override
  final int page;
  @override
  final int size;

  @override
  String toString() {
    return 'PaginationMeta(total: $total, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(this);
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta({
    required final int total,
    required final int page,
    required final int size,
  }) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
