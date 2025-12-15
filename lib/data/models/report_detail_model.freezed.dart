// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportDetailModel _$ReportDetailModelFromJson(Map<String, dynamic> json) {
  return _ReportDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ReportDetailModel {
  int get id => throw _privateConstructorUsedError;
  int get requestId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<ImageModel> get images => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get supervisorId => throw _privateConstructorUsedError;
  String get supervisorName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDetailModelCopyWith<ReportDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDetailModelCopyWith<$Res> {
  factory $ReportDetailModelCopyWith(
    ReportDetailModel value,
    $Res Function(ReportDetailModel) then,
  ) = _$ReportDetailModelCopyWithImpl<$Res, ReportDetailModel>;
  @useResult
  $Res call({
    int id,
    int requestId,
    String title,
    String summary,
    @JsonKey(defaultValue: []) List<ImageModel> images,
    DateTime createdAt,
    int supervisorId,
    String supervisorName,
  });
}

/// @nodoc
class _$ReportDetailModelCopyWithImpl<$Res, $Val extends ReportDetailModel>
    implements $ReportDetailModelCopyWith<$Res> {
  _$ReportDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? title = null,
    Object? summary = null,
    Object? images = null,
    Object? createdAt = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            requestId: null == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<ImageModel>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            supervisorId: null == supervisorId
                ? _value.supervisorId
                : supervisorId // ignore: cast_nullable_to_non_nullable
                      as int,
            supervisorName: null == supervisorName
                ? _value.supervisorName
                : supervisorName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportDetailModelImplCopyWith<$Res>
    implements $ReportDetailModelCopyWith<$Res> {
  factory _$$ReportDetailModelImplCopyWith(
    _$ReportDetailModelImpl value,
    $Res Function(_$ReportDetailModelImpl) then,
  ) = __$$ReportDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int requestId,
    String title,
    String summary,
    @JsonKey(defaultValue: []) List<ImageModel> images,
    DateTime createdAt,
    int supervisorId,
    String supervisorName,
  });
}

/// @nodoc
class __$$ReportDetailModelImplCopyWithImpl<$Res>
    extends _$ReportDetailModelCopyWithImpl<$Res, _$ReportDetailModelImpl>
    implements _$$ReportDetailModelImplCopyWith<$Res> {
  __$$ReportDetailModelImplCopyWithImpl(
    _$ReportDetailModelImpl _value,
    $Res Function(_$ReportDetailModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requestId = null,
    Object? title = null,
    Object? summary = null,
    Object? images = null,
    Object? createdAt = null,
    Object? supervisorId = null,
    Object? supervisorName = null,
  }) {
    return _then(
      _$ReportDetailModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        requestId: null == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<ImageModel>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        supervisorId: null == supervisorId
            ? _value.supervisorId
            : supervisorId // ignore: cast_nullable_to_non_nullable
                  as int,
        supervisorName: null == supervisorName
            ? _value.supervisorName
            : supervisorName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDetailModelImpl implements _ReportDetailModel {
  const _$ReportDetailModelImpl({
    required this.id,
    required this.requestId,
    required this.title,
    required this.summary,
    @JsonKey(defaultValue: []) required final List<ImageModel> images,
    required this.createdAt,
    required this.supervisorId,
    required this.supervisorName,
  }) : _images = images;

  factory _$ReportDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final int requestId;
  @override
  final String title;
  @override
  final String summary;
  final List<ImageModel> _images;
  @override
  @JsonKey(defaultValue: [])
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DateTime createdAt;
  @override
  final int supervisorId;
  @override
  final String supervisorName;

  @override
  String toString() {
    return 'ReportDetailModel(id: $id, requestId: $requestId, title: $title, summary: $summary, images: $images, createdAt: $createdAt, supervisorId: $supervisorId, supervisorName: $supervisorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.supervisorId, supervisorId) ||
                other.supervisorId == supervisorId) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    requestId,
    title,
    summary,
    const DeepCollectionEquality().hash(_images),
    createdAt,
    supervisorId,
    supervisorName,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDetailModelImplCopyWith<_$ReportDetailModelImpl> get copyWith =>
      __$$ReportDetailModelImplCopyWithImpl<_$ReportDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDetailModelImplToJson(this);
  }
}

abstract class _ReportDetailModel implements ReportDetailModel {
  const factory _ReportDetailModel({
    required final int id,
    required final int requestId,
    required final String title,
    required final String summary,
    @JsonKey(defaultValue: []) required final List<ImageModel> images,
    required final DateTime createdAt,
    required final int supervisorId,
    required final String supervisorName,
  }) = _$ReportDetailModelImpl;

  factory _ReportDetailModel.fromJson(Map<String, dynamic> json) =
      _$ReportDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  int get requestId;
  @override
  String get title;
  @override
  String get summary;
  @override
  @JsonKey(defaultValue: [])
  List<ImageModel> get images;
  @override
  DateTime get createdAt;
  @override
  int get supervisorId;
  @override
  String get supervisorName;
  @override
  @JsonKey(ignore: true)
  _$$ReportDetailModelImplCopyWith<_$ReportDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
