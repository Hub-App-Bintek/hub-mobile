// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_projects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultationProjects _$ConsultationProjectsFromJson(Map<String, dynamic> json) {
  return _ConsultationProjects.fromJson(json);
}

/// @nodoc
mixin _$ConsultationProjects {
  List<Project>? get content => throw _privateConstructorUsedError;
  Pageable? get pageable => throw _privateConstructorUsedError;
  int? get totalElements => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  bool? get last => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  Sort? get sort => throw _privateConstructorUsedError;
  int? get numberOfElements => throw _privateConstructorUsedError;
  bool? get first => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultationProjectsCopyWith<ConsultationProjects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationProjectsCopyWith<$Res> {
  factory $ConsultationProjectsCopyWith(
    ConsultationProjects value,
    $Res Function(ConsultationProjects) then,
  ) = _$ConsultationProjectsCopyWithImpl<$Res, ConsultationProjects>;
  @useResult
  $Res call({
    List<Project>? content,
    Pageable? pageable,
    int? totalElements,
    int? totalPages,
    bool? last,
    int? size,
    int? number,
    Sort? sort,
    int? numberOfElements,
    bool? first,
    bool? empty,
  });

  $PageableCopyWith<$Res>? get pageable;
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$ConsultationProjectsCopyWithImpl<
  $Res,
  $Val extends ConsultationProjects
>
    implements $ConsultationProjectsCopyWith<$Res> {
  _$ConsultationProjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? pageable = freezed,
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? first = freezed,
    Object? empty = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<Project>?,
            pageable: freezed == pageable
                ? _value.pageable
                : pageable // ignore: cast_nullable_to_non_nullable
                      as Pageable?,
            totalElements: freezed == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalPages: freezed == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int?,
            last: freezed == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            number: freezed == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int?,
            sort: freezed == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                      as Sort?,
            numberOfElements: freezed == numberOfElements
                ? _value.numberOfElements
                : numberOfElements // ignore: cast_nullable_to_non_nullable
                      as int?,
            first: freezed == first
                ? _value.first
                : first // ignore: cast_nullable_to_non_nullable
                      as bool?,
            empty: freezed == empty
                ? _value.empty
                : empty // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $PageableCopyWith<$Res>? get pageable {
    if (_value.pageable == null) {
      return null;
    }

    return $PageableCopyWith<$Res>(_value.pageable!, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationProjectsImplCopyWith<$Res>
    implements $ConsultationProjectsCopyWith<$Res> {
  factory _$$ConsultationProjectsImplCopyWith(
    _$ConsultationProjectsImpl value,
    $Res Function(_$ConsultationProjectsImpl) then,
  ) = __$$ConsultationProjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Project>? content,
    Pageable? pageable,
    int? totalElements,
    int? totalPages,
    bool? last,
    int? size,
    int? number,
    Sort? sort,
    int? numberOfElements,
    bool? first,
    bool? empty,
  });

  @override
  $PageableCopyWith<$Res>? get pageable;
  @override
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$ConsultationProjectsImplCopyWithImpl<$Res>
    extends _$ConsultationProjectsCopyWithImpl<$Res, _$ConsultationProjectsImpl>
    implements _$$ConsultationProjectsImplCopyWith<$Res> {
  __$$ConsultationProjectsImplCopyWithImpl(
    _$ConsultationProjectsImpl _value,
    $Res Function(_$ConsultationProjectsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? pageable = freezed,
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? first = freezed,
    Object? empty = freezed,
  }) {
    return _then(
      _$ConsultationProjectsImpl(
        content: freezed == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<Project>?,
        pageable: freezed == pageable
            ? _value.pageable
            : pageable // ignore: cast_nullable_to_non_nullable
                  as Pageable?,
        totalElements: freezed == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPages: freezed == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int?,
        last: freezed == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        number: freezed == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int?,
        sort: freezed == sort
            ? _value.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as Sort?,
        numberOfElements: freezed == numberOfElements
            ? _value.numberOfElements
            : numberOfElements // ignore: cast_nullable_to_non_nullable
                  as int?,
        first: freezed == first
            ? _value.first
            : first // ignore: cast_nullable_to_non_nullable
                  as bool?,
        empty: freezed == empty
            ? _value.empty
            : empty // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationProjectsImpl implements _ConsultationProjects {
  const _$ConsultationProjectsImpl({
    final List<Project>? content,
    this.pageable,
    this.totalElements,
    this.totalPages,
    this.last,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  }) : _content = content;

  factory _$ConsultationProjectsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationProjectsImplFromJson(json);

  final List<Project>? _content;
  @override
  List<Project>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Pageable? pageable;
  @override
  final int? totalElements;
  @override
  final int? totalPages;
  @override
  final bool? last;
  @override
  final int? size;
  @override
  final int? number;
  @override
  final Sort? sort;
  @override
  final int? numberOfElements;
  @override
  final bool? first;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'ConsultationProjects(content: $content, pageable: $pageable, totalElements: $totalElements, totalPages: $totalPages, last: $last, size: $size, number: $number, sort: $sort, numberOfElements: $numberOfElements, first: $first, empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationProjectsImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.numberOfElements, numberOfElements) ||
                other.numberOfElements == numberOfElements) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    pageable,
    totalElements,
    totalPages,
    last,
    size,
    number,
    sort,
    numberOfElements,
    first,
    empty,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationProjectsImplCopyWith<_$ConsultationProjectsImpl>
  get copyWith =>
      __$$ConsultationProjectsImplCopyWithImpl<_$ConsultationProjectsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationProjectsImplToJson(this);
  }
}

abstract class _ConsultationProjects implements ConsultationProjects {
  const factory _ConsultationProjects({
    final List<Project>? content,
    final Pageable? pageable,
    final int? totalElements,
    final int? totalPages,
    final bool? last,
    final int? size,
    final int? number,
    final Sort? sort,
    final int? numberOfElements,
    final bool? first,
    final bool? empty,
  }) = _$ConsultationProjectsImpl;

  factory _ConsultationProjects.fromJson(Map<String, dynamic> json) =
      _$ConsultationProjectsImpl.fromJson;

  @override
  List<Project>? get content;
  @override
  Pageable? get pageable;
  @override
  int? get totalElements;
  @override
  int? get totalPages;
  @override
  bool? get last;
  @override
  int? get size;
  @override
  int? get number;
  @override
  Sort? get sort;
  @override
  int? get numberOfElements;
  @override
  bool? get first;
  @override
  bool? get empty;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationProjectsImplCopyWith<_$ConsultationProjectsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Pageable _$PageableFromJson(Map<String, dynamic> json) {
  return _Pageable.fromJson(json);
}

/// @nodoc
mixin _$Pageable {
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  Sort? get sort => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  bool? get paged => throw _privateConstructorUsedError;
  bool? get unpaged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageableCopyWith<Pageable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableCopyWith<$Res> {
  factory $PageableCopyWith(Pageable value, $Res Function(Pageable) then) =
      _$PageableCopyWithImpl<$Res, Pageable>;
  @useResult
  $Res call({
    int? pageNumber,
    int? pageSize,
    Sort? sort,
    int? offset,
    bool? paged,
    bool? unpaged,
  });

  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PageableCopyWithImpl<$Res, $Val extends Pageable>
    implements $PageableCopyWith<$Res> {
  _$PageableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? sort = freezed,
    Object? offset = freezed,
    Object? paged = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(
      _value.copyWith(
            pageNumber: freezed == pageNumber
                ? _value.pageNumber
                : pageNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            pageSize: freezed == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            sort: freezed == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                      as Sort?,
            offset: freezed == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int?,
            paged: freezed == paged
                ? _value.paged
                : paged // ignore: cast_nullable_to_non_nullable
                      as bool?,
            unpaged: freezed == unpaged
                ? _value.unpaged
                : unpaged // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $SortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageableImplCopyWith<$Res>
    implements $PageableCopyWith<$Res> {
  factory _$$PageableImplCopyWith(
    _$PageableImpl value,
    $Res Function(_$PageableImpl) then,
  ) = __$$PageableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? pageNumber,
    int? pageSize,
    Sort? sort,
    int? offset,
    bool? paged,
    bool? unpaged,
  });

  @override
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$PageableImplCopyWithImpl<$Res>
    extends _$PageableCopyWithImpl<$Res, _$PageableImpl>
    implements _$$PageableImplCopyWith<$Res> {
  __$$PageableImplCopyWithImpl(
    _$PageableImpl _value,
    $Res Function(_$PageableImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? sort = freezed,
    Object? offset = freezed,
    Object? paged = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(
      _$PageableImpl(
        pageNumber: freezed == pageNumber
            ? _value.pageNumber
            : pageNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        pageSize: freezed == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        sort: freezed == sort
            ? _value.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as Sort?,
        offset: freezed == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
        paged: freezed == paged
            ? _value.paged
            : paged // ignore: cast_nullable_to_non_nullable
                  as bool?,
        unpaged: freezed == unpaged
            ? _value.unpaged
            : unpaged // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PageableImpl implements _Pageable {
  const _$PageableImpl({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory _$PageableImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageableImplFromJson(json);

  @override
  final int? pageNumber;
  @override
  final int? pageSize;
  @override
  final Sort? sort;
  @override
  final int? offset;
  @override
  final bool? paged;
  @override
  final bool? unpaged;

  @override
  String toString() {
    return 'Pageable(pageNumber: $pageNumber, pageSize: $pageSize, sort: $sort, offset: $offset, paged: $paged, unpaged: $unpaged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.paged, paged) || other.paged == paged) &&
            (identical(other.unpaged, unpaged) || other.unpaged == unpaged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pageNumber,
    pageSize,
    sort,
    offset,
    paged,
    unpaged,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      __$$PageableImplCopyWithImpl<_$PageableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageableImplToJson(this);
  }
}

abstract class _Pageable implements Pageable {
  const factory _Pageable({
    final int? pageNumber,
    final int? pageSize,
    final Sort? sort,
    final int? offset,
    final bool? paged,
    final bool? unpaged,
  }) = _$PageableImpl;

  factory _Pageable.fromJson(Map<String, dynamic> json) =
      _$PageableImpl.fromJson;

  @override
  int? get pageNumber;
  @override
  int? get pageSize;
  @override
  Sort? get sort;
  @override
  int? get offset;
  @override
  bool? get paged;
  @override
  bool? get unpaged;
  @override
  @JsonKey(ignore: true)
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Sort _$SortFromJson(Map<String, dynamic> json) {
  return _Sort.fromJson(json);
}

/// @nodoc
mixin _$Sort {
  bool? get sorted => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;
  bool? get unsorted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortCopyWith<Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortCopyWith<$Res> {
  factory $SortCopyWith(Sort value, $Res Function(Sort) then) =
      _$SortCopyWithImpl<$Res, Sort>;
  @useResult
  $Res call({bool? sorted, bool? empty, bool? unsorted});
}

/// @nodoc
class _$SortCopyWithImpl<$Res, $Val extends Sort>
    implements $SortCopyWith<$Res> {
  _$SortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorted = freezed,
    Object? empty = freezed,
    Object? unsorted = freezed,
  }) {
    return _then(
      _value.copyWith(
            sorted: freezed == sorted
                ? _value.sorted
                : sorted // ignore: cast_nullable_to_non_nullable
                      as bool?,
            empty: freezed == empty
                ? _value.empty
                : empty // ignore: cast_nullable_to_non_nullable
                      as bool?,
            unsorted: freezed == unsorted
                ? _value.unsorted
                : unsorted // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SortImplCopyWith<$Res> implements $SortCopyWith<$Res> {
  factory _$$SortImplCopyWith(
    _$SortImpl value,
    $Res Function(_$SortImpl) then,
  ) = __$$SortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? sorted, bool? empty, bool? unsorted});
}

/// @nodoc
class __$$SortImplCopyWithImpl<$Res>
    extends _$SortCopyWithImpl<$Res, _$SortImpl>
    implements _$$SortImplCopyWith<$Res> {
  __$$SortImplCopyWithImpl(_$SortImpl _value, $Res Function(_$SortImpl) _then)
    : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorted = freezed,
    Object? empty = freezed,
    Object? unsorted = freezed,
  }) {
    return _then(
      _$SortImpl(
        sorted: freezed == sorted
            ? _value.sorted
            : sorted // ignore: cast_nullable_to_non_nullable
                  as bool?,
        empty: freezed == empty
            ? _value.empty
            : empty // ignore: cast_nullable_to_non_nullable
                  as bool?,
        unsorted: freezed == unsorted
            ? _value.unsorted
            : unsorted // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SortImpl implements _Sort {
  const _$SortImpl({this.sorted, this.empty, this.unsorted});

  factory _$SortImpl.fromJson(Map<String, dynamic> json) =>
      _$$SortImplFromJson(json);

  @override
  final bool? sorted;
  @override
  final bool? empty;
  @override
  final bool? unsorted;

  @override
  String toString() {
    return 'Sort(sorted: $sorted, empty: $empty, unsorted: $unsorted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortImpl &&
            (identical(other.sorted, sorted) || other.sorted == sorted) &&
            (identical(other.empty, empty) || other.empty == empty) &&
            (identical(other.unsorted, unsorted) ||
                other.unsorted == unsorted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sorted, empty, unsorted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortImplCopyWith<_$SortImpl> get copyWith =>
      __$$SortImplCopyWithImpl<_$SortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SortImplToJson(this);
  }
}

abstract class _Sort implements Sort {
  const factory _Sort({
    final bool? sorted,
    final bool? empty,
    final bool? unsorted,
  }) = _$SortImpl;

  factory _Sort.fromJson(Map<String, dynamic> json) = _$SortImpl.fromJson;

  @override
  bool? get sorted;
  @override
  bool? get empty;
  @override
  bool? get unsorted;
  @override
  @JsonKey(ignore: true)
  _$$SortImplCopyWith<_$SortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
