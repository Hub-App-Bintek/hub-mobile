// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_version_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContractVersionResponse _$ContractVersionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ContractVersionResponse.fromJson(json);
}

/// @nodoc
mixin _$ContractVersionResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get consultationId => throw _privateConstructorUsedError;
  ContractDocumentInfo? get documentInfo => throw _privateConstructorUsedError;
  String? get contractStatus => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractVersionResponseCopyWith<ContractVersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractVersionResponseCopyWith<$Res> {
  factory $ContractVersionResponseCopyWith(
    ContractVersionResponse value,
    $Res Function(ContractVersionResponse) then,
  ) = _$ContractVersionResponseCopyWithImpl<$Res, ContractVersionResponse>;
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    ContractDocumentInfo? documentInfo,
    String? contractStatus,
    String? createdAt,
    String? updatedAt,
  });

  $ContractDocumentInfoCopyWith<$Res>? get documentInfo;
}

/// @nodoc
class _$ContractVersionResponseCopyWithImpl<
  $Res,
  $Val extends ContractVersionResponse
>
    implements $ContractVersionResponseCopyWith<$Res> {
  _$ContractVersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? documentInfo = freezed,
    Object? contractStatus = freezed,
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
            documentInfo: freezed == documentInfo
                ? _value.documentInfo
                : documentInfo // ignore: cast_nullable_to_non_nullable
                      as ContractDocumentInfo?,
            contractStatus: freezed == contractStatus
                ? _value.contractStatus
                : contractStatus // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $ContractDocumentInfoCopyWith<$Res>? get documentInfo {
    if (_value.documentInfo == null) {
      return null;
    }

    return $ContractDocumentInfoCopyWith<$Res>(_value.documentInfo!, (value) {
      return _then(_value.copyWith(documentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContractVersionResponseImplCopyWith<$Res>
    implements $ContractVersionResponseCopyWith<$Res> {
  factory _$$ContractVersionResponseImplCopyWith(
    _$ContractVersionResponseImpl value,
    $Res Function(_$ContractVersionResponseImpl) then,
  ) = __$$ContractVersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? consultationId,
    ContractDocumentInfo? documentInfo,
    String? contractStatus,
    String? createdAt,
    String? updatedAt,
  });

  @override
  $ContractDocumentInfoCopyWith<$Res>? get documentInfo;
}

/// @nodoc
class __$$ContractVersionResponseImplCopyWithImpl<$Res>
    extends
        _$ContractVersionResponseCopyWithImpl<
          $Res,
          _$ContractVersionResponseImpl
        >
    implements _$$ContractVersionResponseImplCopyWith<$Res> {
  __$$ContractVersionResponseImplCopyWithImpl(
    _$ContractVersionResponseImpl _value,
    $Res Function(_$ContractVersionResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? consultationId = freezed,
    Object? documentInfo = freezed,
    Object? contractStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ContractVersionResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationId: freezed == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        documentInfo: freezed == documentInfo
            ? _value.documentInfo
            : documentInfo // ignore: cast_nullable_to_non_nullable
                  as ContractDocumentInfo?,
        contractStatus: freezed == contractStatus
            ? _value.contractStatus
            : contractStatus // ignore: cast_nullable_to_non_nullable
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
class _$ContractVersionResponseImpl implements _ContractVersionResponse {
  const _$ContractVersionResponseImpl({
    this.id,
    this.consultationId,
    this.documentInfo,
    this.contractStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory _$ContractVersionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractVersionResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? consultationId;
  @override
  final ContractDocumentInfo? documentInfo;
  @override
  final String? contractStatus;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ContractVersionResponse(id: $id, consultationId: $consultationId, documentInfo: $documentInfo, contractStatus: $contractStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractVersionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.documentInfo, documentInfo) ||
                other.documentInfo == documentInfo) &&
            (identical(other.contractStatus, contractStatus) ||
                other.contractStatus == contractStatus) &&
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
    documentInfo,
    contractStatus,
    createdAt,
    updatedAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractVersionResponseImplCopyWith<_$ContractVersionResponseImpl>
  get copyWith =>
      __$$ContractVersionResponseImplCopyWithImpl<
        _$ContractVersionResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractVersionResponseImplToJson(this);
  }
}

abstract class _ContractVersionResponse implements ContractVersionResponse {
  const factory _ContractVersionResponse({
    final String? id,
    final String? consultationId,
    final ContractDocumentInfo? documentInfo,
    final String? contractStatus,
    final String? createdAt,
    final String? updatedAt,
  }) = _$ContractVersionResponseImpl;

  factory _ContractVersionResponse.fromJson(Map<String, dynamic> json) =
      _$ContractVersionResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get consultationId;
  @override
  ContractDocumentInfo? get documentInfo;
  @override
  String? get contractStatus;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ContractVersionResponseImplCopyWith<_$ContractVersionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ContractDocumentInfo _$ContractDocumentInfoFromJson(Map<String, dynamic> json) {
  return _ContractDocumentInfo.fromJson(json);
}

/// @nodoc
mixin _$ContractDocumentInfo {
  String? get documentType => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get versionId => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  String? get fileId => throw _privateConstructorUsedError;
  String? get uploadedBy => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get uploadedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractDocumentInfoCopyWith<ContractDocumentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractDocumentInfoCopyWith<$Res> {
  factory $ContractDocumentInfoCopyWith(
    ContractDocumentInfo value,
    $Res Function(ContractDocumentInfo) then,
  ) = _$ContractDocumentInfoCopyWithImpl<$Res, ContractDocumentInfo>;
  @useResult
  $Res call({
    String? documentType,
    String? version,
    String? versionId,
    String? fileUrl,
    String? fileId,
    String? uploadedBy,
    String? status,
    String? notes,
    String? uploadedAt,
  });
}

/// @nodoc
class _$ContractDocumentInfoCopyWithImpl<
  $Res,
  $Val extends ContractDocumentInfo
>
    implements $ContractDocumentInfoCopyWith<$Res> {
  _$ContractDocumentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = freezed,
    Object? version = freezed,
    Object? versionId = freezed,
    Object? fileUrl = freezed,
    Object? fileId = freezed,
    Object? uploadedBy = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            documentType: freezed == documentType
                ? _value.documentType
                : documentType // ignore: cast_nullable_to_non_nullable
                      as String?,
            version: freezed == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String?,
            versionId: freezed == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileId: freezed == fileId
                ? _value.fileId
                : fileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadedBy: freezed == uploadedBy
                ? _value.uploadedBy
                : uploadedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploadedAt: freezed == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContractDocumentInfoImplCopyWith<$Res>
    implements $ContractDocumentInfoCopyWith<$Res> {
  factory _$$ContractDocumentInfoImplCopyWith(
    _$ContractDocumentInfoImpl value,
    $Res Function(_$ContractDocumentInfoImpl) then,
  ) = __$$ContractDocumentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? documentType,
    String? version,
    String? versionId,
    String? fileUrl,
    String? fileId,
    String? uploadedBy,
    String? status,
    String? notes,
    String? uploadedAt,
  });
}

/// @nodoc
class __$$ContractDocumentInfoImplCopyWithImpl<$Res>
    extends _$ContractDocumentInfoCopyWithImpl<$Res, _$ContractDocumentInfoImpl>
    implements _$$ContractDocumentInfoImplCopyWith<$Res> {
  __$$ContractDocumentInfoImplCopyWithImpl(
    _$ContractDocumentInfoImpl _value,
    $Res Function(_$ContractDocumentInfoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = freezed,
    Object? version = freezed,
    Object? versionId = freezed,
    Object? fileUrl = freezed,
    Object? fileId = freezed,
    Object? uploadedBy = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(
      _$ContractDocumentInfoImpl(
        documentType: freezed == documentType
            ? _value.documentType
            : documentType // ignore: cast_nullable_to_non_nullable
                  as String?,
        version: freezed == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
        versionId: freezed == versionId
            ? _value.versionId
            : versionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileId: freezed == fileId
            ? _value.fileId
            : fileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadedBy: freezed == uploadedBy
            ? _value.uploadedBy
            : uploadedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploadedAt: freezed == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractDocumentInfoImpl implements _ContractDocumentInfo {
  const _$ContractDocumentInfoImpl({
    this.documentType,
    this.version,
    this.versionId,
    this.fileUrl,
    this.fileId,
    this.uploadedBy,
    this.status,
    this.notes,
    this.uploadedAt,
  });

  factory _$ContractDocumentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractDocumentInfoImplFromJson(json);

  @override
  final String? documentType;
  @override
  final String? version;
  @override
  final String? versionId;
  @override
  final String? fileUrl;
  @override
  final String? fileId;
  @override
  final String? uploadedBy;
  @override
  final String? status;
  @override
  final String? notes;
  @override
  final String? uploadedAt;

  @override
  String toString() {
    return 'ContractDocumentInfo(documentType: $documentType, version: $version, versionId: $versionId, fileUrl: $fileUrl, fileId: $fileId, uploadedBy: $uploadedBy, status: $status, notes: $notes, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractDocumentInfoImpl &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    documentType,
    version,
    versionId,
    fileUrl,
    fileId,
    uploadedBy,
    status,
    notes,
    uploadedAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractDocumentInfoImplCopyWith<_$ContractDocumentInfoImpl>
  get copyWith =>
      __$$ContractDocumentInfoImplCopyWithImpl<_$ContractDocumentInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractDocumentInfoImplToJson(this);
  }
}

abstract class _ContractDocumentInfo implements ContractDocumentInfo {
  const factory _ContractDocumentInfo({
    final String? documentType,
    final String? version,
    final String? versionId,
    final String? fileUrl,
    final String? fileId,
    final String? uploadedBy,
    final String? status,
    final String? notes,
    final String? uploadedAt,
  }) = _$ContractDocumentInfoImpl;

  factory _ContractDocumentInfo.fromJson(Map<String, dynamic> json) =
      _$ContractDocumentInfoImpl.fromJson;

  @override
  String? get documentType;
  @override
  String? get version;
  @override
  String? get versionId;
  @override
  String? get fileUrl;
  @override
  String? get fileId;
  @override
  String? get uploadedBy;
  @override
  String? get status;
  @override
  String? get notes;
  @override
  String? get uploadedAt;
  @override
  @JsonKey(ignore: true)
  _$$ContractDocumentInfoImplCopyWith<_$ContractDocumentInfoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
