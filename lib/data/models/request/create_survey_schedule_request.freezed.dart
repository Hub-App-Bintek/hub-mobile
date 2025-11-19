// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_survey_schedule_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateSurveyScheduleRequest _$CreateSurveyScheduleRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateSurveyScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSurveyScheduleRequest {
  /// Unified payload for both create and reschedule
  /// - proposedDateTime: ISO 8601 (UTC), e.g., 2025-10-29T10:00:00Z
  /// - surveyCost: optional (consultation may set during create; omitted for reschedule)
  /// - notes: optional
  String get proposedDateTime => throw _privateConstructorUsedError;
  double? get surveyCost => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateSurveyScheduleRequestCopyWith<CreateSurveyScheduleRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSurveyScheduleRequestCopyWith<$Res> {
  factory $CreateSurveyScheduleRequestCopyWith(
    CreateSurveyScheduleRequest value,
    $Res Function(CreateSurveyScheduleRequest) then,
  ) =
      _$CreateSurveyScheduleRequestCopyWithImpl<
        $Res,
        CreateSurveyScheduleRequest
      >;
  @useResult
  $Res call({String proposedDateTime, double? surveyCost, String? notes});
}

/// @nodoc
class _$CreateSurveyScheduleRequestCopyWithImpl<
  $Res,
  $Val extends CreateSurveyScheduleRequest
>
    implements $CreateSurveyScheduleRequestCopyWith<$Res> {
  _$CreateSurveyScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proposedDateTime = null,
    Object? surveyCost = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            proposedDateTime: null == proposedDateTime
                ? _value.proposedDateTime
                : proposedDateTime // ignore: cast_nullable_to_non_nullable
                      as String,
            surveyCost: freezed == surveyCost
                ? _value.surveyCost
                : surveyCost // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSurveyScheduleRequestImplCopyWith<$Res>
    implements $CreateSurveyScheduleRequestCopyWith<$Res> {
  factory _$$CreateSurveyScheduleRequestImplCopyWith(
    _$CreateSurveyScheduleRequestImpl value,
    $Res Function(_$CreateSurveyScheduleRequestImpl) then,
  ) = __$$CreateSurveyScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String proposedDateTime, double? surveyCost, String? notes});
}

/// @nodoc
class __$$CreateSurveyScheduleRequestImplCopyWithImpl<$Res>
    extends
        _$CreateSurveyScheduleRequestCopyWithImpl<
          $Res,
          _$CreateSurveyScheduleRequestImpl
        >
    implements _$$CreateSurveyScheduleRequestImplCopyWith<$Res> {
  __$$CreateSurveyScheduleRequestImplCopyWithImpl(
    _$CreateSurveyScheduleRequestImpl _value,
    $Res Function(_$CreateSurveyScheduleRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proposedDateTime = null,
    Object? surveyCost = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$CreateSurveyScheduleRequestImpl(
        proposedDateTime: null == proposedDateTime
            ? _value.proposedDateTime
            : proposedDateTime // ignore: cast_nullable_to_non_nullable
                  as String,
        surveyCost: freezed == surveyCost
            ? _value.surveyCost
            : surveyCost // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSurveyScheduleRequestImpl
    implements _CreateSurveyScheduleRequest {
  const _$CreateSurveyScheduleRequestImpl({
    required this.proposedDateTime,
    this.surveyCost,
    this.notes,
  });

  factory _$CreateSurveyScheduleRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateSurveyScheduleRequestImplFromJson(json);

  /// Unified payload for both create and reschedule
  /// - proposedDateTime: ISO 8601 (UTC), e.g., 2025-10-29T10:00:00Z
  /// - surveyCost: optional (consultation may set during create; omitted for reschedule)
  /// - notes: optional
  @override
  final String proposedDateTime;
  @override
  final double? surveyCost;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CreateSurveyScheduleRequest(proposedDateTime: $proposedDateTime, surveyCost: $surveyCost, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSurveyScheduleRequestImpl &&
            (identical(other.proposedDateTime, proposedDateTime) ||
                other.proposedDateTime == proposedDateTime) &&
            (identical(other.surveyCost, surveyCost) ||
                other.surveyCost == surveyCost) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, proposedDateTime, surveyCost, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSurveyScheduleRequestImplCopyWith<_$CreateSurveyScheduleRequestImpl>
  get copyWith =>
      __$$CreateSurveyScheduleRequestImplCopyWithImpl<
        _$CreateSurveyScheduleRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSurveyScheduleRequestImplToJson(this);
  }
}

abstract class _CreateSurveyScheduleRequest
    implements CreateSurveyScheduleRequest {
  const factory _CreateSurveyScheduleRequest({
    required final String proposedDateTime,
    final double? surveyCost,
    final String? notes,
  }) = _$CreateSurveyScheduleRequestImpl;

  factory _CreateSurveyScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSurveyScheduleRequestImpl.fromJson;

  @override
  /// Unified payload for both create and reschedule
  /// - proposedDateTime: ISO 8601 (UTC), e.g., 2025-10-29T10:00:00Z
  /// - surveyCost: optional (consultation may set during create; omitted for reschedule)
  /// - notes: optional
  String get proposedDateTime;
  @override
  double? get surveyCost;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$CreateSurveyScheduleRequestImplCopyWith<_$CreateSurveyScheduleRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
