// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultationsResponse _$ConsultationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ConsultationsResponse.fromJson(json);
}

/// @nodoc
mixin _$ConsultationsResponse {
  ConsultationProjects? get projects => throw _privateConstructorUsedError;
  int? get inProgressCount => throw _privateConstructorUsedError;
  int? get pendingCount => throw _privateConstructorUsedError;
  int? get doneCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultationsResponseCopyWith<ConsultationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationsResponseCopyWith<$Res> {
  factory $ConsultationsResponseCopyWith(
    ConsultationsResponse value,
    $Res Function(ConsultationsResponse) then,
  ) = _$ConsultationsResponseCopyWithImpl<$Res, ConsultationsResponse>;
  @useResult
  $Res call({
    ConsultationProjects? projects,
    int? inProgressCount,
    int? pendingCount,
    int? doneCount,
  });

  $ConsultationProjectsCopyWith<$Res>? get projects;
}

/// @nodoc
class _$ConsultationsResponseCopyWithImpl<
  $Res,
  $Val extends ConsultationsResponse
>
    implements $ConsultationsResponseCopyWith<$Res> {
  _$ConsultationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? inProgressCount = freezed,
    Object? pendingCount = freezed,
    Object? doneCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            projects: freezed == projects
                ? _value.projects
                : projects // ignore: cast_nullable_to_non_nullable
                      as ConsultationProjects?,
            inProgressCount: freezed == inProgressCount
                ? _value.inProgressCount
                : inProgressCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            pendingCount: freezed == pendingCount
                ? _value.pendingCount
                : pendingCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            doneCount: freezed == doneCount
                ? _value.doneCount
                : doneCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultationProjectsCopyWith<$Res>? get projects {
    if (_value.projects == null) {
      return null;
    }

    return $ConsultationProjectsCopyWith<$Res>(_value.projects!, (value) {
      return _then(_value.copyWith(projects: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationsResponseImplCopyWith<$Res>
    implements $ConsultationsResponseCopyWith<$Res> {
  factory _$$ConsultationsResponseImplCopyWith(
    _$ConsultationsResponseImpl value,
    $Res Function(_$ConsultationsResponseImpl) then,
  ) = __$$ConsultationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ConsultationProjects? projects,
    int? inProgressCount,
    int? pendingCount,
    int? doneCount,
  });

  @override
  $ConsultationProjectsCopyWith<$Res>? get projects;
}

/// @nodoc
class __$$ConsultationsResponseImplCopyWithImpl<$Res>
    extends
        _$ConsultationsResponseCopyWithImpl<$Res, _$ConsultationsResponseImpl>
    implements _$$ConsultationsResponseImplCopyWith<$Res> {
  __$$ConsultationsResponseImplCopyWithImpl(
    _$ConsultationsResponseImpl _value,
    $Res Function(_$ConsultationsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? inProgressCount = freezed,
    Object? pendingCount = freezed,
    Object? doneCount = freezed,
  }) {
    return _then(
      _$ConsultationsResponseImpl(
        projects: freezed == projects
            ? _value.projects
            : projects // ignore: cast_nullable_to_non_nullable
                  as ConsultationProjects?,
        inProgressCount: freezed == inProgressCount
            ? _value.inProgressCount
            : inProgressCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        pendingCount: freezed == pendingCount
            ? _value.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        doneCount: freezed == doneCount
            ? _value.doneCount
            : doneCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationsResponseImpl extends _ConsultationsResponse {
  const _$ConsultationsResponseImpl({
    this.projects,
    this.inProgressCount,
    this.pendingCount,
    this.doneCount,
  }) : super._();

  factory _$ConsultationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationsResponseImplFromJson(json);

  @override
  final ConsultationProjects? projects;
  @override
  final int? inProgressCount;
  @override
  final int? pendingCount;
  @override
  final int? doneCount;

  @override
  String toString() {
    return 'ConsultationsResponse(projects: $projects, inProgressCount: $inProgressCount, pendingCount: $pendingCount, doneCount: $doneCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationsResponseImpl &&
            (identical(other.projects, projects) ||
                other.projects == projects) &&
            (identical(other.inProgressCount, inProgressCount) ||
                other.inProgressCount == inProgressCount) &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.doneCount, doneCount) ||
                other.doneCount == doneCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projects,
    inProgressCount,
    pendingCount,
    doneCount,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationsResponseImplCopyWith<_$ConsultationsResponseImpl>
  get copyWith =>
      __$$ConsultationsResponseImplCopyWithImpl<_$ConsultationsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationsResponseImplToJson(this);
  }
}

abstract class _ConsultationsResponse extends ConsultationsResponse {
  const factory _ConsultationsResponse({
    final ConsultationProjects? projects,
    final int? inProgressCount,
    final int? pendingCount,
    final int? doneCount,
  }) = _$ConsultationsResponseImpl;
  const _ConsultationsResponse._() : super._();

  factory _ConsultationsResponse.fromJson(Map<String, dynamic> json) =
      _$ConsultationsResponseImpl.fromJson;

  @override
  ConsultationProjects? get projects;
  @override
  int? get inProgressCount;
  @override
  int? get pendingCount;
  @override
  int? get doneCount;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationsResponseImplCopyWith<_$ConsultationsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
