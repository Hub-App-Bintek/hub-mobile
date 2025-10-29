// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) {
  return _SurveyResponse.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get consultationId => throw _privateConstructorUsedError;
  String? get proposedDateTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyResponseCopyWith<SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseCopyWith<$Res> {
  factory $SurveyResponseCopyWith(
    SurveyResponse value,
    $Res Function(SurveyResponse) then,
  ) = _$SurveyResponseCopyWithImpl<$Res, SurveyResponse>;
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    String? proposedDateTime,
    String? notes,
    String? status,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class _$SurveyResponseCopyWithImpl<$Res, $Val extends SurveyResponse>
    implements $SurveyResponseCopyWith<$Res> {
  _$SurveyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? proposedDateTime = freezed,
    Object? notes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationId: freezed == consultationId
                ? _value.consultationId
                : consultationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            proposedDateTime: freezed == proposedDateTime
                ? _value.proposedDateTime
                : proposedDateTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SurveyResponseImplCopyWith<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  factory _$$SurveyResponseImplCopyWith(
    _$SurveyResponseImpl value,
    $Res Function(_$SurveyResponseImpl) then,
  ) = __$$SurveyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    String? proposedDateTime,
    String? notes,
    String? status,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class __$$SurveyResponseImplCopyWithImpl<$Res>
    extends _$SurveyResponseCopyWithImpl<$Res, _$SurveyResponseImpl>
    implements _$$SurveyResponseImplCopyWith<$Res> {
  __$$SurveyResponseImplCopyWithImpl(
    _$SurveyResponseImpl _value,
    $Res Function(_$SurveyResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? proposedDateTime = freezed,
    Object? notes = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SurveyResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationId: freezed == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        proposedDateTime: freezed == proposedDateTime
            ? _value.proposedDateTime
            : proposedDateTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyResponseImpl implements _SurveyResponse {
  const _$SurveyResponseImpl({
    this.id,
    this.consultationId,
    this.proposedDateTime,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory _$SurveyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? consultationId;
  @override
  final String? proposedDateTime;
  @override
  final String? notes;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'SurveyResponse(id: $id, consultationId: $consultationId, proposedDateTime: $proposedDateTime, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.proposedDateTime, proposedDateTime) ||
                other.proposedDateTime == proposedDateTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    consultationId,
    proposedDateTime,
    notes,
    status,
    createdAt,
    updatedAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      __$$SurveyResponseImplCopyWithImpl<_$SurveyResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyResponseImplToJson(this);
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  const factory _SurveyResponse({
    final String? id,
    final String? consultationId,
    final String? proposedDateTime,
    final String? notes,
    final String? status,
    final String? createdAt,
    final String? updatedAt,
  }) = _$SurveyResponseImpl;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$SurveyResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get consultationId;
  @override
  String? get proposedDateTime;
  @override
  String? get notes;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
