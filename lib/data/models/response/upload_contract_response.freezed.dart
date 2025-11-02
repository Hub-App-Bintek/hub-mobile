// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_contract_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UploadContractResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get consultationId => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  bool? get digitalSignature => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadContractResponseCopyWith<UploadContractResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadContractResponseCopyWith<$Res> {
  factory $UploadContractResponseCopyWith(
    UploadContractResponse value,
    $Res Function(UploadContractResponse) then,
  ) = _$UploadContractResponseCopyWithImpl<$Res, UploadContractResponse>;
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    String? fileUrl,
    bool? digitalSignature,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$UploadContractResponseCopyWithImpl<
  $Res,
  $Val extends UploadContractResponse
>
    implements $UploadContractResponseCopyWith<$Res> {
  _$UploadContractResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? fileUrl = freezed,
    Object? digitalSignature = freezed,
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
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            digitalSignature: freezed == digitalSignature
                ? _value.digitalSignature
                : digitalSignature // ignore: cast_nullable_to_non_nullable
                      as bool?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadContractResponseImplCopyWith<$Res>
    implements $UploadContractResponseCopyWith<$Res> {
  factory _$$UploadContractResponseImplCopyWith(
    _$UploadContractResponseImpl value,
    $Res Function(_$UploadContractResponseImpl) then,
  ) = __$$UploadContractResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    String? fileUrl,
    bool? digitalSignature,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UploadContractResponseImplCopyWithImpl<$Res>
    extends
        _$UploadContractResponseCopyWithImpl<$Res, _$UploadContractResponseImpl>
    implements _$$UploadContractResponseImplCopyWith<$Res> {
  __$$UploadContractResponseImplCopyWithImpl(
    _$UploadContractResponseImpl _value,
    $Res Function(_$UploadContractResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? fileUrl = freezed,
    Object? digitalSignature = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UploadContractResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationId: freezed == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        digitalSignature: freezed == digitalSignature
            ? _value.digitalSignature
            : digitalSignature // ignore: cast_nullable_to_non_nullable
                  as bool?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$UploadContractResponseImpl implements _UploadContractResponse {
  const _$UploadContractResponseImpl({
    this.id,
    this.consultationId,
    this.fileUrl,
    this.digitalSignature,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  @override
  final String? id;
  @override
  final String? consultationId;
  @override
  final String? fileUrl;
  @override
  final bool? digitalSignature;
  @override
  final String? status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UploadContractResponse(id: $id, consultationId: $consultationId, fileUrl: $fileUrl, digitalSignature: $digitalSignature, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadContractResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.digitalSignature, digitalSignature) ||
                other.digitalSignature == digitalSignature) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    consultationId,
    fileUrl,
    digitalSignature,
    status,
    createdAt,
    updatedAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadContractResponseImplCopyWith<_$UploadContractResponseImpl>
  get copyWith =>
      __$$UploadContractResponseImplCopyWithImpl<_$UploadContractResponseImpl>(
        this,
        _$identity,
      );
}

abstract class _UploadContractResponse implements UploadContractResponse {
  const factory _UploadContractResponse({
    final String? id,
    final String? consultationId,
    final String? fileUrl,
    final bool? digitalSignature,
    final String? status,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$UploadContractResponseImpl;

  @override
  String? get id;
  @override
  String? get consultationId;
  @override
  String? get fileUrl;
  @override
  bool? get digitalSignature;
  @override
  String? get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UploadContractResponseImplCopyWith<_$UploadContractResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
