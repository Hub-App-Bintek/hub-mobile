// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Consultation _$ConsultationFromJson(Map<String, dynamic> json) {
  return _Consultation.fromJson(json);
}

/// @nodoc
mixin _$Consultation {
  String? get consultationId => throw _privateConstructorUsedError;
  String? get consultantName => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  CurrentSurveySchedule? get currentSurveySchedule =>
      throw _privateConstructorUsedError;
  List<ProjectHistory>? get consultationHistory =>
      throw _privateConstructorUsedError;
  DocumentExchange? get documentExchange => throw _privateConstructorUsedError;
  List<CurrentSurveySchedule>? get revisionRequests =>
      throw _privateConstructorUsedError;
  List<CurrentSurveySchedule>? get surveySchedules =>
      throw _privateConstructorUsedError;
  String? get permit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultationCopyWith<Consultation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCopyWith<$Res> {
  factory $ConsultationCopyWith(
    Consultation value,
    $Res Function(Consultation) then,
  ) = _$ConsultationCopyWithImpl<$Res, Consultation>;
  @useResult
  $Res call({
    String? consultationId,
    String? consultantName,
    String? scheduledAt,
    String? status,
    String? notes,
    CurrentSurveySchedule? currentSurveySchedule,
    List<ProjectHistory>? consultationHistory,
    DocumentExchange? documentExchange,
    List<CurrentSurveySchedule>? revisionRequests,
    List<CurrentSurveySchedule>? surveySchedules,
    String? permit,
  });

  $CurrentSurveyScheduleCopyWith<$Res>? get currentSurveySchedule;
  $DocumentExchangeCopyWith<$Res>? get documentExchange;
}

/// @nodoc
class _$ConsultationCopyWithImpl<$Res, $Val extends Consultation>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationId = freezed,
    Object? consultantName = freezed,
    Object? scheduledAt = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? currentSurveySchedule = freezed,
    Object? consultationHistory = freezed,
    Object? documentExchange = freezed,
    Object? revisionRequests = freezed,
    Object? surveySchedules = freezed,
    Object? permit = freezed,
  }) {
    return _then(
      _value.copyWith(
            consultationId: freezed == consultationId
                ? _value.consultationId
                : consultationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultantName: freezed == consultantName
                ? _value.consultantName
                : consultantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            scheduledAt: freezed == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentSurveySchedule: freezed == currentSurveySchedule
                ? _value.currentSurveySchedule
                : currentSurveySchedule // ignore: cast_nullable_to_non_nullable
                      as CurrentSurveySchedule?,
            consultationHistory: freezed == consultationHistory
                ? _value.consultationHistory
                : consultationHistory // ignore: cast_nullable_to_non_nullable
                      as List<ProjectHistory>?,
            documentExchange: freezed == documentExchange
                ? _value.documentExchange
                : documentExchange // ignore: cast_nullable_to_non_nullable
                      as DocumentExchange?,
            revisionRequests: freezed == revisionRequests
                ? _value.revisionRequests
                : revisionRequests // ignore: cast_nullable_to_non_nullable
                      as List<CurrentSurveySchedule>?,
            surveySchedules: freezed == surveySchedules
                ? _value.surveySchedules
                : surveySchedules // ignore: cast_nullable_to_non_nullable
                      as List<CurrentSurveySchedule>?,
            permit: freezed == permit
                ? _value.permit
                : permit // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentSurveyScheduleCopyWith<$Res>? get currentSurveySchedule {
    if (_value.currentSurveySchedule == null) {
      return null;
    }

    return $CurrentSurveyScheduleCopyWith<$Res>(_value.currentSurveySchedule!, (
      value,
    ) {
      return _then(_value.copyWith(currentSurveySchedule: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentExchangeCopyWith<$Res>? get documentExchange {
    if (_value.documentExchange == null) {
      return null;
    }

    return $DocumentExchangeCopyWith<$Res>(_value.documentExchange!, (value) {
      return _then(_value.copyWith(documentExchange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationImplCopyWith<$Res>
    implements $ConsultationCopyWith<$Res> {
  factory _$$ConsultationImplCopyWith(
    _$ConsultationImpl value,
    $Res Function(_$ConsultationImpl) then,
  ) = __$$ConsultationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? consultationId,
    String? consultantName,
    String? scheduledAt,
    String? status,
    String? notes,
    CurrentSurveySchedule? currentSurveySchedule,
    List<ProjectHistory>? consultationHistory,
    DocumentExchange? documentExchange,
    List<CurrentSurveySchedule>? revisionRequests,
    List<CurrentSurveySchedule>? surveySchedules,
    String? permit,
  });

  @override
  $CurrentSurveyScheduleCopyWith<$Res>? get currentSurveySchedule;
  @override
  $DocumentExchangeCopyWith<$Res>? get documentExchange;
}

/// @nodoc
class __$$ConsultationImplCopyWithImpl<$Res>
    extends _$ConsultationCopyWithImpl<$Res, _$ConsultationImpl>
    implements _$$ConsultationImplCopyWith<$Res> {
  __$$ConsultationImplCopyWithImpl(
    _$ConsultationImpl _value,
    $Res Function(_$ConsultationImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationId = freezed,
    Object? consultantName = freezed,
    Object? scheduledAt = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? currentSurveySchedule = freezed,
    Object? consultationHistory = freezed,
    Object? documentExchange = freezed,
    Object? revisionRequests = freezed,
    Object? surveySchedules = freezed,
    Object? permit = freezed,
  }) {
    return _then(
      _$ConsultationImpl(
        consultationId: freezed == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultantName: freezed == consultantName
            ? _value.consultantName
            : consultantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        scheduledAt: freezed == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentSurveySchedule: freezed == currentSurveySchedule
            ? _value.currentSurveySchedule
            : currentSurveySchedule // ignore: cast_nullable_to_non_nullable
                  as CurrentSurveySchedule?,
        consultationHistory: freezed == consultationHistory
            ? _value._consultationHistory
            : consultationHistory // ignore: cast_nullable_to_non_nullable
                  as List<ProjectHistory>?,
        documentExchange: freezed == documentExchange
            ? _value.documentExchange
            : documentExchange // ignore: cast_nullable_to_non_nullable
                  as DocumentExchange?,
        revisionRequests: freezed == revisionRequests
            ? _value._revisionRequests
            : revisionRequests // ignore: cast_nullable_to_non_nullable
                  as List<CurrentSurveySchedule>?,
        surveySchedules: freezed == surveySchedules
            ? _value._surveySchedules
            : surveySchedules // ignore: cast_nullable_to_non_nullable
                  as List<CurrentSurveySchedule>?,
        permit: freezed == permit
            ? _value.permit
            : permit // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationImpl implements _Consultation {
  const _$ConsultationImpl({
    this.consultationId,
    this.consultantName,
    this.scheduledAt,
    this.status,
    this.notes,
    this.currentSurveySchedule,
    final List<ProjectHistory>? consultationHistory,
    this.documentExchange,
    final List<CurrentSurveySchedule>? revisionRequests,
    final List<CurrentSurveySchedule>? surveySchedules,
    this.permit,
  }) : _consultationHistory = consultationHistory,
       _revisionRequests = revisionRequests,
       _surveySchedules = surveySchedules;

  factory _$ConsultationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationImplFromJson(json);

  @override
  final String? consultationId;
  @override
  final String? consultantName;
  @override
  final String? scheduledAt;
  @override
  final String? status;
  @override
  final String? notes;
  @override
  final CurrentSurveySchedule? currentSurveySchedule;
  final List<ProjectHistory>? _consultationHistory;
  @override
  List<ProjectHistory>? get consultationHistory {
    final value = _consultationHistory;
    if (value == null) return null;
    if (_consultationHistory is EqualUnmodifiableListView)
      return _consultationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DocumentExchange? documentExchange;
  final List<CurrentSurveySchedule>? _revisionRequests;
  @override
  List<CurrentSurveySchedule>? get revisionRequests {
    final value = _revisionRequests;
    if (value == null) return null;
    if (_revisionRequests is EqualUnmodifiableListView)
      return _revisionRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CurrentSurveySchedule>? _surveySchedules;
  @override
  List<CurrentSurveySchedule>? get surveySchedules {
    final value = _surveySchedules;
    if (value == null) return null;
    if (_surveySchedules is EqualUnmodifiableListView) return _surveySchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? permit;

  @override
  String toString() {
    return 'Consultation(consultationId: $consultationId, consultantName: $consultantName, scheduledAt: $scheduledAt, status: $status, notes: $notes, currentSurveySchedule: $currentSurveySchedule, consultationHistory: $consultationHistory, documentExchange: $documentExchange, revisionRequests: $revisionRequests, surveySchedules: $surveySchedules, permit: $permit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationImpl &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.consultantName, consultantName) ||
                other.consultantName == consultantName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.currentSurveySchedule, currentSurveySchedule) ||
                other.currentSurveySchedule == currentSurveySchedule) &&
            const DeepCollectionEquality().equals(
              other._consultationHistory,
              _consultationHistory,
            ) &&
            (identical(other.documentExchange, documentExchange) ||
                other.documentExchange == documentExchange) &&
            const DeepCollectionEquality().equals(
              other._revisionRequests,
              _revisionRequests,
            ) &&
            const DeepCollectionEquality().equals(
              other._surveySchedules,
              _surveySchedules,
            ) &&
            (identical(other.permit, permit) || other.permit == permit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultationId,
    consultantName,
    scheduledAt,
    status,
    notes,
    currentSurveySchedule,
    const DeepCollectionEquality().hash(_consultationHistory),
    documentExchange,
    const DeepCollectionEquality().hash(_revisionRequests),
    const DeepCollectionEquality().hash(_surveySchedules),
    permit,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      __$$ConsultationImplCopyWithImpl<_$ConsultationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationImplToJson(this);
  }
}

abstract class _Consultation implements Consultation {
  const factory _Consultation({
    final String? consultationId,
    final String? consultantName,
    final String? scheduledAt,
    final String? status,
    final String? notes,
    final CurrentSurveySchedule? currentSurveySchedule,
    final List<ProjectHistory>? consultationHistory,
    final DocumentExchange? documentExchange,
    final List<CurrentSurveySchedule>? revisionRequests,
    final List<CurrentSurveySchedule>? surveySchedules,
    final String? permit,
  }) = _$ConsultationImpl;

  factory _Consultation.fromJson(Map<String, dynamic> json) =
      _$ConsultationImpl.fromJson;

  @override
  String? get consultationId;
  @override
  String? get consultantName;
  @override
  String? get scheduledAt;
  @override
  String? get status;
  @override
  String? get notes;
  @override
  CurrentSurveySchedule? get currentSurveySchedule;
  @override
  List<ProjectHistory>? get consultationHistory;
  @override
  DocumentExchange? get documentExchange;
  @override
  List<CurrentSurveySchedule>? get revisionRequests;
  @override
  List<CurrentSurveySchedule>? get surveySchedules;
  @override
  String? get permit;
  @override
  @JsonKey(ignore: true)
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
