// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_document_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DesignDocumentResponse _$DesignDocumentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DesignDocumentResponse.fromJson(json);
}

/// @nodoc
mixin _$DesignDocumentResponse {
  String? get designDocumentId => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get versionName => throw _privateConstructorUsedError;
  String? get latestUploadedAt => throw _privateConstructorUsedError;
  List<DesignDocument> get documents => throw _privateConstructorUsedError;
  String? get designDocumentStatus => throw _privateConstructorUsedError;
  bool? get canDownload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DesignDocumentResponseCopyWith<DesignDocumentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignDocumentResponseCopyWith<$Res> {
  factory $DesignDocumentResponseCopyWith(
    DesignDocumentResponse value,
    $Res Function(DesignDocumentResponse) then,
  ) = _$DesignDocumentResponseCopyWithImpl<$Res, DesignDocumentResponse>;
  @useResult
  $Res call({
    String? designDocumentId,
    String? version,
    String? versionName,
    String? latestUploadedAt,
    List<DesignDocument> documents,
    String? designDocumentStatus,
    bool? canDownload,
  });
}

/// @nodoc
class _$DesignDocumentResponseCopyWithImpl<
  $Res,
  $Val extends DesignDocumentResponse
>
    implements $DesignDocumentResponseCopyWith<$Res> {
  _$DesignDocumentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designDocumentId = freezed,
    Object? version = freezed,
    Object? versionName = freezed,
    Object? latestUploadedAt = freezed,
    Object? documents = null,
    Object? designDocumentStatus = freezed,
    Object? canDownload = freezed,
  }) {
    return _then(
      _value.copyWith(
            designDocumentId: freezed == designDocumentId
                ? _value.designDocumentId
                : designDocumentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            version: freezed == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String?,
            versionName: freezed == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                      as String?,
            latestUploadedAt: freezed == latestUploadedAt
                ? _value.latestUploadedAt
                : latestUploadedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            documents: null == documents
                ? _value.documents
                : documents // ignore: cast_nullable_to_non_nullable
                      as List<DesignDocument>,
            designDocumentStatus: freezed == designDocumentStatus
                ? _value.designDocumentStatus
                : designDocumentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            canDownload: freezed == canDownload
                ? _value.canDownload
                : canDownload // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DesignDocumentResponseImplCopyWith<$Res>
    implements $DesignDocumentResponseCopyWith<$Res> {
  factory _$$DesignDocumentResponseImplCopyWith(
    _$DesignDocumentResponseImpl value,
    $Res Function(_$DesignDocumentResponseImpl) then,
  ) = __$$DesignDocumentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? designDocumentId,
    String? version,
    String? versionName,
    String? latestUploadedAt,
    List<DesignDocument> documents,
    String? designDocumentStatus,
    bool? canDownload,
  });
}

/// @nodoc
class __$$DesignDocumentResponseImplCopyWithImpl<$Res>
    extends
        _$DesignDocumentResponseCopyWithImpl<$Res, _$DesignDocumentResponseImpl>
    implements _$$DesignDocumentResponseImplCopyWith<$Res> {
  __$$DesignDocumentResponseImplCopyWithImpl(
    _$DesignDocumentResponseImpl _value,
    $Res Function(_$DesignDocumentResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designDocumentId = freezed,
    Object? version = freezed,
    Object? versionName = freezed,
    Object? latestUploadedAt = freezed,
    Object? documents = null,
    Object? designDocumentStatus = freezed,
    Object? canDownload = freezed,
  }) {
    return _then(
      _$DesignDocumentResponseImpl(
        designDocumentId: freezed == designDocumentId
            ? _value.designDocumentId
            : designDocumentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        version: freezed == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
        versionName: freezed == versionName
            ? _value.versionName
            : versionName // ignore: cast_nullable_to_non_nullable
                  as String?,
        latestUploadedAt: freezed == latestUploadedAt
            ? _value.latestUploadedAt
            : latestUploadedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        documents: null == documents
            ? _value._documents
            : documents // ignore: cast_nullable_to_non_nullable
                  as List<DesignDocument>,
        designDocumentStatus: freezed == designDocumentStatus
            ? _value.designDocumentStatus
            : designDocumentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        canDownload: freezed == canDownload
            ? _value.canDownload
            : canDownload // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DesignDocumentResponseImpl implements _DesignDocumentResponse {
  const _$DesignDocumentResponseImpl({
    this.designDocumentId,
    this.version,
    this.versionName,
    this.latestUploadedAt,
    final List<DesignDocument> documents = const <DesignDocument>[],
    this.designDocumentStatus,
    this.canDownload,
  }) : _documents = documents;

  factory _$DesignDocumentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesignDocumentResponseImplFromJson(json);

  @override
  final String? designDocumentId;
  @override
  final String? version;
  @override
  final String? versionName;
  @override
  final String? latestUploadedAt;
  final List<DesignDocument> _documents;
  @override
  @JsonKey()
  List<DesignDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final String? designDocumentStatus;
  @override
  final bool? canDownload;

  @override
  String toString() {
    return 'DesignDocumentResponse(designDocumentId: $designDocumentId, version: $version, versionName: $versionName, latestUploadedAt: $latestUploadedAt, documents: $documents, designDocumentStatus: $designDocumentStatus, canDownload: $canDownload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignDocumentResponseImpl &&
            (identical(other.designDocumentId, designDocumentId) ||
                other.designDocumentId == designDocumentId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.versionName, versionName) ||
                other.versionName == versionName) &&
            (identical(other.latestUploadedAt, latestUploadedAt) ||
                other.latestUploadedAt == latestUploadedAt) &&
            const DeepCollectionEquality().equals(
              other._documents,
              _documents,
            ) &&
            (identical(other.designDocumentStatus, designDocumentStatus) ||
                other.designDocumentStatus == designDocumentStatus) &&
            (identical(other.canDownload, canDownload) ||
                other.canDownload == canDownload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    designDocumentId,
    version,
    versionName,
    latestUploadedAt,
    const DeepCollectionEquality().hash(_documents),
    designDocumentStatus,
    canDownload,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignDocumentResponseImplCopyWith<_$DesignDocumentResponseImpl>
  get copyWith =>
      __$$DesignDocumentResponseImplCopyWithImpl<_$DesignDocumentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DesignDocumentResponseImplToJson(this);
  }
}

abstract class _DesignDocumentResponse implements DesignDocumentResponse {
  const factory _DesignDocumentResponse({
    final String? designDocumentId,
    final String? version,
    final String? versionName,
    final String? latestUploadedAt,
    final List<DesignDocument> documents,
    final String? designDocumentStatus,
    final bool? canDownload,
  }) = _$DesignDocumentResponseImpl;

  factory _DesignDocumentResponse.fromJson(Map<String, dynamic> json) =
      _$DesignDocumentResponseImpl.fromJson;

  @override
  String? get designDocumentId;
  @override
  String? get version;
  @override
  String? get versionName;
  @override
  String? get latestUploadedAt;
  @override
  List<DesignDocument> get documents;
  @override
  String? get designDocumentStatus;
  @override
  bool? get canDownload;
  @override
  @JsonKey(ignore: true)
  _$$DesignDocumentResponseImplCopyWith<_$DesignDocumentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
