// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_contract_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApproveContractRequest _$ApproveContractRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ApproveContractRequest.fromJson(json);
}

/// @nodoc
mixin _$ApproveContractRequest {
  String get approvedDocumentVersionId => throw _privateConstructorUsedError;
  String? get revisionNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveContractRequestCopyWith<ApproveContractRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveContractRequestCopyWith<$Res> {
  factory $ApproveContractRequestCopyWith(
    ApproveContractRequest value,
    $Res Function(ApproveContractRequest) then,
  ) = _$ApproveContractRequestCopyWithImpl<$Res, ApproveContractRequest>;
  @useResult
  $Res call({String approvedDocumentVersionId, String? revisionNotes});
}

/// @nodoc
class _$ApproveContractRequestCopyWithImpl<
  $Res,
  $Val extends ApproveContractRequest
>
    implements $ApproveContractRequestCopyWith<$Res> {
  _$ApproveContractRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedDocumentVersionId = null,
    Object? revisionNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            approvedDocumentVersionId: null == approvedDocumentVersionId
                ? _value.approvedDocumentVersionId
                : approvedDocumentVersionId // ignore: cast_nullable_to_non_nullable
                      as String,
            revisionNotes: freezed == revisionNotes
                ? _value.revisionNotes
                : revisionNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApproveContractRequestImplCopyWith<$Res>
    implements $ApproveContractRequestCopyWith<$Res> {
  factory _$$ApproveContractRequestImplCopyWith(
    _$ApproveContractRequestImpl value,
    $Res Function(_$ApproveContractRequestImpl) then,
  ) = __$$ApproveContractRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String approvedDocumentVersionId, String? revisionNotes});
}

/// @nodoc
class __$$ApproveContractRequestImplCopyWithImpl<$Res>
    extends
        _$ApproveContractRequestCopyWithImpl<$Res, _$ApproveContractRequestImpl>
    implements _$$ApproveContractRequestImplCopyWith<$Res> {
  __$$ApproveContractRequestImplCopyWithImpl(
    _$ApproveContractRequestImpl _value,
    $Res Function(_$ApproveContractRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedDocumentVersionId = null,
    Object? revisionNotes = freezed,
  }) {
    return _then(
      _$ApproveContractRequestImpl(
        approvedDocumentVersionId: null == approvedDocumentVersionId
            ? _value.approvedDocumentVersionId
            : approvedDocumentVersionId // ignore: cast_nullable_to_non_nullable
                  as String,
        revisionNotes: freezed == revisionNotes
            ? _value.revisionNotes
            : revisionNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveContractRequestImpl implements _ApproveContractRequest {
  const _$ApproveContractRequestImpl({
    required this.approvedDocumentVersionId,
    this.revisionNotes,
  });

  factory _$ApproveContractRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveContractRequestImplFromJson(json);

  @override
  final String approvedDocumentVersionId;
  @override
  final String? revisionNotes;

  @override
  String toString() {
    return 'ApproveContractRequest(approvedDocumentVersionId: $approvedDocumentVersionId, revisionNotes: $revisionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveContractRequestImpl &&
            (identical(
                  other.approvedDocumentVersionId,
                  approvedDocumentVersionId,
                ) ||
                other.approvedDocumentVersionId == approvedDocumentVersionId) &&
            (identical(other.revisionNotes, revisionNotes) ||
                other.revisionNotes == revisionNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, approvedDocumentVersionId, revisionNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveContractRequestImplCopyWith<_$ApproveContractRequestImpl>
  get copyWith =>
      __$$ApproveContractRequestImplCopyWithImpl<_$ApproveContractRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveContractRequestImplToJson(this);
  }
}

abstract class _ApproveContractRequest implements ApproveContractRequest {
  const factory _ApproveContractRequest({
    required final String approvedDocumentVersionId,
    final String? revisionNotes,
  }) = _$ApproveContractRequestImpl;

  factory _ApproveContractRequest.fromJson(Map<String, dynamic> json) =
      _$ApproveContractRequestImpl.fromJson;

  @override
  String get approvedDocumentVersionId;
  @override
  String? get revisionNotes;
  @override
  @JsonKey(ignore: true)
  _$$ApproveContractRequestImplCopyWith<_$ApproveContractRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
