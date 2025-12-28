// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringDocumentModel _$MonitoringDocumentModelFromJson(
    Map<String, dynamic> json) {
  return _MonitoringDocumentModel.fromJson(json);
}

/// @nodoc
mixin _$MonitoringDocumentModel {
  int get id => throw _privateConstructorUsedError;
  int get monitoringId => throw _privateConstructorUsedError;
  int get uploadedBy => throw _privateConstructorUsedError;
  String get uploaderName => throw _privateConstructorUsedError;
  String get documentUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringDocumentModelCopyWith<MonitoringDocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringDocumentModelCopyWith<$Res> {
  factory $MonitoringDocumentModelCopyWith(MonitoringDocumentModel value,
          $Res Function(MonitoringDocumentModel) then) =
      _$MonitoringDocumentModelCopyWithImpl<$Res, MonitoringDocumentModel>;
  @useResult
  $Res call(
      {int id,
      int monitoringId,
      int uploadedBy,
      String uploaderName,
      String documentUrl,
      String title,
      String? description,
      DateTime createdAt});
}

/// @nodoc
class _$MonitoringDocumentModelCopyWithImpl<$Res,
        $Val extends MonitoringDocumentModel>
    implements $MonitoringDocumentModelCopyWith<$Res> {
  _$MonitoringDocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monitoringId = null,
    Object? uploadedBy = null,
    Object? uploaderName = null,
    Object? documentUrl = null,
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      monitoringId: null == monitoringId
          ? _value.monitoringId
          : monitoringId // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      uploaderName: null == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringDocumentModelImplCopyWith<$Res>
    implements $MonitoringDocumentModelCopyWith<$Res> {
  factory _$$MonitoringDocumentModelImplCopyWith(
          _$MonitoringDocumentModelImpl value,
          $Res Function(_$MonitoringDocumentModelImpl) then) =
      __$$MonitoringDocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int monitoringId,
      int uploadedBy,
      String uploaderName,
      String documentUrl,
      String title,
      String? description,
      DateTime createdAt});
}

/// @nodoc
class __$$MonitoringDocumentModelImplCopyWithImpl<$Res>
    extends _$MonitoringDocumentModelCopyWithImpl<$Res,
        _$MonitoringDocumentModelImpl>
    implements _$$MonitoringDocumentModelImplCopyWith<$Res> {
  __$$MonitoringDocumentModelImplCopyWithImpl(
      _$MonitoringDocumentModelImpl _value,
      $Res Function(_$MonitoringDocumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? monitoringId = null,
    Object? uploadedBy = null,
    Object? uploaderName = null,
    Object? documentUrl = null,
    Object? title = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$MonitoringDocumentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      monitoringId: null == monitoringId
          ? _value.monitoringId
          : monitoringId // ignore: cast_nullable_to_non_nullable
              as int,
      uploadedBy: null == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as int,
      uploaderName: null == uploaderName
          ? _value.uploaderName
          : uploaderName // ignore: cast_nullable_to_non_nullable
              as String,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringDocumentModelImpl implements _MonitoringDocumentModel {
  const _$MonitoringDocumentModelImpl(
      {required this.id,
      required this.monitoringId,
      required this.uploadedBy,
      required this.uploaderName,
      required this.documentUrl,
      required this.title,
      this.description,
      required this.createdAt});

  factory _$MonitoringDocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringDocumentModelImplFromJson(json);

  @override
  final int id;
  @override
  final int monitoringId;
  @override
  final int uploadedBy;
  @override
  final String uploaderName;
  @override
  final String documentUrl;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MonitoringDocumentModel(id: $id, monitoringId: $monitoringId, uploadedBy: $uploadedBy, uploaderName: $uploaderName, documentUrl: $documentUrl, title: $title, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringDocumentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.monitoringId, monitoringId) ||
                other.monitoringId == monitoringId) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            (identical(other.uploaderName, uploaderName) ||
                other.uploaderName == uploaderName) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, monitoringId, uploadedBy,
      uploaderName, documentUrl, title, description, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringDocumentModelImplCopyWith<_$MonitoringDocumentModelImpl>
      get copyWith => __$$MonitoringDocumentModelImplCopyWithImpl<
          _$MonitoringDocumentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringDocumentModelImplToJson(
      this,
    );
  }
}

abstract class _MonitoringDocumentModel implements MonitoringDocumentModel {
  const factory _MonitoringDocumentModel(
      {required final int id,
      required final int monitoringId,
      required final int uploadedBy,
      required final String uploaderName,
      required final String documentUrl,
      required final String title,
      final String? description,
      required final DateTime createdAt}) = _$MonitoringDocumentModelImpl;

  factory _MonitoringDocumentModel.fromJson(Map<String, dynamic> json) =
      _$MonitoringDocumentModelImpl.fromJson;

  @override
  int get id;
  @override
  int get monitoringId;
  @override
  int get uploadedBy;
  @override
  String get uploaderName;
  @override
  String get documentUrl;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringDocumentModelImplCopyWith<_$MonitoringDocumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
