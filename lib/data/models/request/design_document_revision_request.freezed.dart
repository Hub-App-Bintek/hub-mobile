// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_document_revision_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DesignDocumentRevisionRequest _$DesignDocumentRevisionRequestFromJson(
  Map<String, dynamic> json,
) {
  return _DesignDocumentRevisionRequest.fromJson(json);
}

/// @nodoc
mixin _$DesignDocumentRevisionRequest {
  String get designDocumentId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DesignDocumentRevisionRequestCopyWith<DesignDocumentRevisionRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignDocumentRevisionRequestCopyWith<$Res> {
  factory $DesignDocumentRevisionRequestCopyWith(
    DesignDocumentRevisionRequest value,
    $Res Function(DesignDocumentRevisionRequest) then,
  ) =
      _$DesignDocumentRevisionRequestCopyWithImpl<
        $Res,
        DesignDocumentRevisionRequest
      >;
  @useResult
  $Res call({String designDocumentId, String notes});
}

/// @nodoc
class _$DesignDocumentRevisionRequestCopyWithImpl<
  $Res,
  $Val extends DesignDocumentRevisionRequest
>
    implements $DesignDocumentRevisionRequestCopyWith<$Res> {
  _$DesignDocumentRevisionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? designDocumentId = null, Object? notes = null}) {
    return _then(
      _value.copyWith(
            designDocumentId: null == designDocumentId
                ? _value.designDocumentId
                : designDocumentId // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DesignDocumentRevisionRequestImplCopyWith<$Res>
    implements $DesignDocumentRevisionRequestCopyWith<$Res> {
  factory _$$DesignDocumentRevisionRequestImplCopyWith(
    _$DesignDocumentRevisionRequestImpl value,
    $Res Function(_$DesignDocumentRevisionRequestImpl) then,
  ) = __$$DesignDocumentRevisionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String designDocumentId, String notes});
}

/// @nodoc
class __$$DesignDocumentRevisionRequestImplCopyWithImpl<$Res>
    extends
        _$DesignDocumentRevisionRequestCopyWithImpl<
          $Res,
          _$DesignDocumentRevisionRequestImpl
        >
    implements _$$DesignDocumentRevisionRequestImplCopyWith<$Res> {
  __$$DesignDocumentRevisionRequestImplCopyWithImpl(
    _$DesignDocumentRevisionRequestImpl _value,
    $Res Function(_$DesignDocumentRevisionRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? designDocumentId = null, Object? notes = null}) {
    return _then(
      _$DesignDocumentRevisionRequestImpl(
        designDocumentId: null == designDocumentId
            ? _value.designDocumentId
            : designDocumentId // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DesignDocumentRevisionRequestImpl
    implements _DesignDocumentRevisionRequest {
  const _$DesignDocumentRevisionRequestImpl({
    required this.designDocumentId,
    this.notes = '',
  });

  factory _$DesignDocumentRevisionRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$DesignDocumentRevisionRequestImplFromJson(json);

  @override
  final String designDocumentId;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'DesignDocumentRevisionRequest(designDocumentId: $designDocumentId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignDocumentRevisionRequestImpl &&
            (identical(other.designDocumentId, designDocumentId) ||
                other.designDocumentId == designDocumentId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, designDocumentId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignDocumentRevisionRequestImplCopyWith<
    _$DesignDocumentRevisionRequestImpl
  >
  get copyWith =>
      __$$DesignDocumentRevisionRequestImplCopyWithImpl<
        _$DesignDocumentRevisionRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesignDocumentRevisionRequestImplToJson(this);
  }
}

abstract class _DesignDocumentRevisionRequest
    implements DesignDocumentRevisionRequest {
  const factory _DesignDocumentRevisionRequest({
    required final String designDocumentId,
    final String notes,
  }) = _$DesignDocumentRevisionRequestImpl;

  factory _DesignDocumentRevisionRequest.fromJson(Map<String, dynamic> json) =
      _$DesignDocumentRevisionRequestImpl.fromJson;

  @override
  String get designDocumentId;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$DesignDocumentRevisionRequestImplCopyWith<
    _$DesignDocumentRevisionRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
