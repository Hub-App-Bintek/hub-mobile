// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_consultation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateConsultationRequest _$CreateConsultationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateConsultationRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateConsultationRequest {
  int get consultantId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get consultationType => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateConsultationRequestCopyWith<CreateConsultationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateConsultationRequestCopyWith<$Res> {
  factory $CreateConsultationRequestCopyWith(
    CreateConsultationRequest value,
    $Res Function(CreateConsultationRequest) then,
  ) = _$CreateConsultationRequestCopyWithImpl<$Res, CreateConsultationRequest>;
  @useResult
  $Res call({
    int consultantId,
    String projectId,
    String consultationType,
    String channel,
  });
}

/// @nodoc
class _$CreateConsultationRequestCopyWithImpl<
  $Res,
  $Val extends CreateConsultationRequest
>
    implements $CreateConsultationRequestCopyWith<$Res> {
  _$CreateConsultationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultantId = null,
    Object? projectId = null,
    Object? consultationType = null,
    Object? channel = null,
  }) {
    return _then(
      _value.copyWith(
            consultantId: null == consultantId
                ? _value.consultantId
                : consultantId // ignore: cast_nullable_to_non_nullable
                      as int,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            consultationType: null == consultationType
                ? _value.consultationType
                : consultationType // ignore: cast_nullable_to_non_nullable
                      as String,
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateConsultationRequestImplCopyWith<$Res>
    implements $CreateConsultationRequestCopyWith<$Res> {
  factory _$$CreateConsultationRequestImplCopyWith(
    _$CreateConsultationRequestImpl value,
    $Res Function(_$CreateConsultationRequestImpl) then,
  ) = __$$CreateConsultationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int consultantId,
    String projectId,
    String consultationType,
    String channel,
  });
}

/// @nodoc
class __$$CreateConsultationRequestImplCopyWithImpl<$Res>
    extends
        _$CreateConsultationRequestCopyWithImpl<
          $Res,
          _$CreateConsultationRequestImpl
        >
    implements _$$CreateConsultationRequestImplCopyWith<$Res> {
  __$$CreateConsultationRequestImplCopyWithImpl(
    _$CreateConsultationRequestImpl _value,
    $Res Function(_$CreateConsultationRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultantId = null,
    Object? projectId = null,
    Object? consultationType = null,
    Object? channel = null,
  }) {
    return _then(
      _$CreateConsultationRequestImpl(
        consultantId: null == consultantId
            ? _value.consultantId
            : consultantId // ignore: cast_nullable_to_non_nullable
                  as int,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        consultationType: null == consultationType
            ? _value.consultationType
            : consultationType // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateConsultationRequestImpl implements _CreateConsultationRequest {
  const _$CreateConsultationRequestImpl({
    required this.consultantId,
    required this.projectId,
    required this.consultationType,
    required this.channel,
  });

  factory _$CreateConsultationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateConsultationRequestImplFromJson(json);

  @override
  final int consultantId;
  @override
  final String projectId;
  @override
  final String consultationType;
  @override
  final String channel;

  @override
  String toString() {
    return 'CreateConsultationRequest(consultantId: $consultantId, projectId: $projectId, consultationType: $consultationType, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateConsultationRequestImpl &&
            (identical(other.consultantId, consultantId) ||
                other.consultantId == consultantId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.consultationType, consultationType) ||
                other.consultationType == consultationType) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultantId,
    projectId,
    consultationType,
    channel,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateConsultationRequestImplCopyWith<_$CreateConsultationRequestImpl>
  get copyWith =>
      __$$CreateConsultationRequestImplCopyWithImpl<
        _$CreateConsultationRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateConsultationRequestImplToJson(this);
  }
}

abstract class _CreateConsultationRequest implements CreateConsultationRequest {
  const factory _CreateConsultationRequest({
    required final int consultantId,
    required final String projectId,
    required final String consultationType,
    required final String channel,
  }) = _$CreateConsultationRequestImpl;

  factory _CreateConsultationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateConsultationRequestImpl.fromJson;

  @override
  int get consultantId;
  @override
  String get projectId;
  @override
  String get consultationType;
  @override
  String get channel;
  @override
  @JsonKey(ignore: true)
  _$$CreateConsultationRequestImplCopyWith<_$CreateConsultationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
