// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_file_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadFileRequest _$UploadFileRequestFromJson(Map<String, dynamic> json) {
  return _UploadFileRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadFileRequest {
  String get filePath =>
      throw _privateConstructorUsedError; // local file path or multipart
  String get fileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFileRequestCopyWith<UploadFileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileRequestCopyWith<$Res> {
  factory $UploadFileRequestCopyWith(
          UploadFileRequest value, $Res Function(UploadFileRequest) then) =
      _$UploadFileRequestCopyWithImpl<$Res, UploadFileRequest>;
  @useResult
  $Res call({String filePath, String fileType});
}

/// @nodoc
class _$UploadFileRequestCopyWithImpl<$Res, $Val extends UploadFileRequest>
    implements $UploadFileRequestCopyWith<$Res> {
  _$UploadFileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? fileType = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFileRequestImplCopyWith<$Res>
    implements $UploadFileRequestCopyWith<$Res> {
  factory _$$UploadFileRequestImplCopyWith(_$UploadFileRequestImpl value,
          $Res Function(_$UploadFileRequestImpl) then) =
      __$$UploadFileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filePath, String fileType});
}

/// @nodoc
class __$$UploadFileRequestImplCopyWithImpl<$Res>
    extends _$UploadFileRequestCopyWithImpl<$Res, _$UploadFileRequestImpl>
    implements _$$UploadFileRequestImplCopyWith<$Res> {
  __$$UploadFileRequestImplCopyWithImpl(_$UploadFileRequestImpl _value,
      $Res Function(_$UploadFileRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? fileType = null,
  }) {
    return _then(_$UploadFileRequestImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileRequestImpl implements _UploadFileRequest {
  const _$UploadFileRequestImpl(
      {required this.filePath, required this.fileType});

  factory _$UploadFileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileRequestImplFromJson(json);

  @override
  final String filePath;
// local file path or multipart
  @override
  final String fileType;

  @override
  String toString() {
    return 'UploadFileRequest(filePath: $filePath, fileType: $fileType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileRequestImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filePath, fileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileRequestImplCopyWith<_$UploadFileRequestImpl> get copyWith =>
      __$$UploadFileRequestImplCopyWithImpl<_$UploadFileRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadFileRequest implements UploadFileRequest {
  const factory _UploadFileRequest(
      {required final String filePath,
      required final String fileType}) = _$UploadFileRequestImpl;

  factory _UploadFileRequest.fromJson(Map<String, dynamic> json) =
      _$UploadFileRequestImpl.fromJson;

  @override
  String get filePath;
  @override // local file path or multipart
  String get fileType;
  @override
  @JsonKey(ignore: true)
  _$$UploadFileRequestImplCopyWith<_$UploadFileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
