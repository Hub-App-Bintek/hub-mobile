// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_file_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) {
  return _UploadFileResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponse {
  String get fileId => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  String get checksum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFileResponseCopyWith<UploadFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseCopyWith<$Res> {
  factory $UploadFileResponseCopyWith(
    UploadFileResponse value,
    $Res Function(UploadFileResponse) then,
  ) = _$UploadFileResponseCopyWithImpl<$Res, UploadFileResponse>;
  @useResult
  $Res call({String fileId, String fileUrl, String checksum});
}

/// @nodoc
class _$UploadFileResponseCopyWithImpl<$Res, $Val extends UploadFileResponse>
    implements $UploadFileResponseCopyWith<$Res> {
  _$UploadFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? fileUrl = null,
    Object? checksum = null,
  }) {
    return _then(
      _value.copyWith(
            fileId: null == fileId
                ? _value.fileId
                : fileId // ignore: cast_nullable_to_non_nullable
                      as String,
            fileUrl: null == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            checksum: null == checksum
                ? _value.checksum
                : checksum // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadFileResponseImplCopyWith<$Res>
    implements $UploadFileResponseCopyWith<$Res> {
  factory _$$UploadFileResponseImplCopyWith(
    _$UploadFileResponseImpl value,
    $Res Function(_$UploadFileResponseImpl) then,
  ) = __$$UploadFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileId, String fileUrl, String checksum});
}

/// @nodoc
class __$$UploadFileResponseImplCopyWithImpl<$Res>
    extends _$UploadFileResponseCopyWithImpl<$Res, _$UploadFileResponseImpl>
    implements _$$UploadFileResponseImplCopyWith<$Res> {
  __$$UploadFileResponseImplCopyWithImpl(
    _$UploadFileResponseImpl _value,
    $Res Function(_$UploadFileResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
    Object? fileUrl = null,
    Object? checksum = null,
  }) {
    return _then(
      _$UploadFileResponseImpl(
        fileId: null == fileId
            ? _value.fileId
            : fileId // ignore: cast_nullable_to_non_nullable
                  as String,
        fileUrl: null == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        checksum: null == checksum
            ? _value.checksum
            : checksum // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseImpl implements _UploadFileResponse {
  const _$UploadFileResponseImpl({
    required this.fileId,
    required this.fileUrl,
    required this.checksum,
  });

  factory _$UploadFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseImplFromJson(json);

  @override
  final String fileId;
  @override
  final String fileUrl;
  @override
  final String checksum;

  @override
  String toString() {
    return 'UploadFileResponse(fileId: $fileId, fileUrl: $fileUrl, checksum: $checksum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fileId, fileUrl, checksum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      __$$UploadFileResponseImplCopyWithImpl<_$UploadFileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseImplToJson(this);
  }
}

abstract class _UploadFileResponse implements UploadFileResponse {
  const factory _UploadFileResponse({
    required final String fileId,
    required final String fileUrl,
    required final String checksum,
  }) = _$UploadFileResponseImpl;

  factory _UploadFileResponse.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseImpl.fromJson;

  @override
  String get fileId;
  @override
  String get fileUrl;
  @override
  String get checksum;
  @override
  @JsonKey(ignore: true)
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
