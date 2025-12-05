// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_consultation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AcceptConsultationRequest _$AcceptConsultationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _AcceptConsultationRequest.fromJson(json);
}

/// @nodoc
mixin _$AcceptConsultationRequest {
  bool get needsSurvey => throw _privateConstructorUsedError;
  String? get surveyDate => throw _privateConstructorUsedError;
  String? get surveyTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptConsultationRequestCopyWith<AcceptConsultationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptConsultationRequestCopyWith<$Res> {
  factory $AcceptConsultationRequestCopyWith(
    AcceptConsultationRequest value,
    $Res Function(AcceptConsultationRequest) then,
  ) = _$AcceptConsultationRequestCopyWithImpl<$Res, AcceptConsultationRequest>;
  @useResult
  $Res call({
    bool needsSurvey,
    String? surveyDate,
    String? surveyTime,
    String? notes,
  });
}

/// @nodoc
class _$AcceptConsultationRequestCopyWithImpl<
  $Res,
  $Val extends AcceptConsultationRequest
>
    implements $AcceptConsultationRequestCopyWith<$Res> {
  _$AcceptConsultationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? needsSurvey = null,
    Object? surveyDate = freezed,
    Object? surveyTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            needsSurvey: null == needsSurvey
                ? _value.needsSurvey
                : needsSurvey // ignore: cast_nullable_to_non_nullable
                      as bool,
            surveyDate: freezed == surveyDate
                ? _value.surveyDate
                : surveyDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            surveyTime: freezed == surveyTime
                ? _value.surveyTime
                : surveyTime // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$AcceptConsultationRequestImplCopyWith<$Res>
    implements $AcceptConsultationRequestCopyWith<$Res> {
  factory _$$AcceptConsultationRequestImplCopyWith(
    _$AcceptConsultationRequestImpl value,
    $Res Function(_$AcceptConsultationRequestImpl) then,
  ) = __$$AcceptConsultationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool needsSurvey,
    String? surveyDate,
    String? surveyTime,
    String? notes,
  });
}

/// @nodoc
class __$$AcceptConsultationRequestImplCopyWithImpl<$Res>
    extends
        _$AcceptConsultationRequestCopyWithImpl<
          $Res,
          _$AcceptConsultationRequestImpl
        >
    implements _$$AcceptConsultationRequestImplCopyWith<$Res> {
  __$$AcceptConsultationRequestImplCopyWithImpl(
    _$AcceptConsultationRequestImpl _value,
    $Res Function(_$AcceptConsultationRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? needsSurvey = null,
    Object? surveyDate = freezed,
    Object? surveyTime = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$AcceptConsultationRequestImpl(
        needsSurvey: null == needsSurvey
            ? _value.needsSurvey
            : needsSurvey // ignore: cast_nullable_to_non_nullable
                  as bool,
        surveyDate: freezed == surveyDate
            ? _value.surveyDate
            : surveyDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        surveyTime: freezed == surveyTime
            ? _value.surveyTime
            : surveyTime // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$AcceptConsultationRequestImpl implements _AcceptConsultationRequest {
  const _$AcceptConsultationRequestImpl({
    required this.needsSurvey,
    this.surveyDate,
    this.surveyTime,
    this.notes,
  });

  factory _$AcceptConsultationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptConsultationRequestImplFromJson(json);

  @override
  final bool needsSurvey;
  @override
  final String? surveyDate;
  @override
  final String? surveyTime;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AcceptConsultationRequest(needsSurvey: $needsSurvey, surveyDate: $surveyDate, surveyTime: $surveyTime, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptConsultationRequestImpl &&
            (identical(other.needsSurvey, needsSurvey) ||
                other.needsSurvey == needsSurvey) &&
            (identical(other.surveyDate, surveyDate) ||
                other.surveyDate == surveyDate) &&
            (identical(other.surveyTime, surveyTime) ||
                other.surveyTime == surveyTime) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, needsSurvey, surveyDate, surveyTime, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptConsultationRequestImplCopyWith<_$AcceptConsultationRequestImpl>
  get copyWith =>
      __$$AcceptConsultationRequestImplCopyWithImpl<
        _$AcceptConsultationRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptConsultationRequestImplToJson(this);
  }
}

abstract class _AcceptConsultationRequest implements AcceptConsultationRequest {
  const factory _AcceptConsultationRequest({
    required final bool needsSurvey,
    final String? surveyDate,
    final String? surveyTime,
    final String? notes,
  }) = _$AcceptConsultationRequestImpl;

  factory _AcceptConsultationRequest.fromJson(Map<String, dynamic> json) =
      _$AcceptConsultationRequestImpl.fromJson;

  @override
  bool get needsSurvey;
  @override
  String? get surveyDate;
  @override
  String? get surveyTime;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$AcceptConsultationRequestImplCopyWith<_$AcceptConsultationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
