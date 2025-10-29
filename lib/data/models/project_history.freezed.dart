// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectHistory _$ProjectHistoryFromJson(Map<String, dynamic> json) {
  return _ProjectHistory.fromJson(json);
}

/// @nodoc
mixin _$ProjectHistory {
  String? get step => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  List<String>? get files => throw _privateConstructorUsedError;
  List<String>? get attachments => throw _privateConstructorUsedError;
  Metadata? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectHistoryCopyWith<ProjectHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectHistoryCopyWith<$Res> {
  factory $ProjectHistoryCopyWith(
    ProjectHistory value,
    $Res Function(ProjectHistory) then,
  ) = _$ProjectHistoryCopyWithImpl<$Res, ProjectHistory>;
  @useResult
  $Res call({
    String? step,
    String? state,
    String? title,
    String? subtitle,
    List<String>? files,
    List<String>? attachments,
    Metadata? metadata,
  });

  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ProjectHistoryCopyWithImpl<$Res, $Val extends ProjectHistory>
    implements $ProjectHistoryCopyWith<$Res> {
  _$ProjectHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? state = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? files = freezed,
    Object? attachments = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            step: freezed == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            files: freezed == files
                ? _value.files
                : files // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            attachments: freezed == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Metadata?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectHistoryImplCopyWith<$Res>
    implements $ProjectHistoryCopyWith<$Res> {
  factory _$$ProjectHistoryImplCopyWith(
    _$ProjectHistoryImpl value,
    $Res Function(_$ProjectHistoryImpl) then,
  ) = __$$ProjectHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? step,
    String? state,
    String? title,
    String? subtitle,
    List<String>? files,
    List<String>? attachments,
    Metadata? metadata,
  });

  @override
  $MetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ProjectHistoryImplCopyWithImpl<$Res>
    extends _$ProjectHistoryCopyWithImpl<$Res, _$ProjectHistoryImpl>
    implements _$$ProjectHistoryImplCopyWith<$Res> {
  __$$ProjectHistoryImplCopyWithImpl(
    _$ProjectHistoryImpl _value,
    $Res Function(_$ProjectHistoryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = freezed,
    Object? state = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? files = freezed,
    Object? attachments = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$ProjectHistoryImpl(
        step: freezed == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        files: freezed == files
            ? _value._files
            : files // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        attachments: freezed == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        metadata: freezed == metadata
            ? _value.metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Metadata?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectHistoryImpl implements _ProjectHistory {
  const _$ProjectHistoryImpl({
    this.step,
    this.state,
    this.title,
    this.subtitle,
    final List<String>? files,
    final List<String>? attachments,
    this.metadata,
  }) : _files = files,
       _attachments = attachments;

  factory _$ProjectHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectHistoryImplFromJson(json);

  @override
  final String? step;
  @override
  final String? state;
  @override
  final String? title;
  @override
  final String? subtitle;
  final List<String>? _files;
  @override
  List<String>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _attachments;
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Metadata? metadata;

  @override
  String toString() {
    return 'ProjectHistory(step: $step, state: $state, title: $title, subtitle: $subtitle, files: $files, attachments: $attachments, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectHistoryImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    state,
    title,
    subtitle,
    const DeepCollectionEquality().hash(_files),
    const DeepCollectionEquality().hash(_attachments),
    metadata,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectHistoryImplCopyWith<_$ProjectHistoryImpl> get copyWith =>
      __$$ProjectHistoryImplCopyWithImpl<_$ProjectHistoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectHistoryImplToJson(this);
  }
}

abstract class _ProjectHistory implements ProjectHistory {
  const factory _ProjectHistory({
    final String? step,
    final String? state,
    final String? title,
    final String? subtitle,
    final List<String>? files,
    final List<String>? attachments,
    final Metadata? metadata,
  }) = _$ProjectHistoryImpl;

  factory _ProjectHistory.fromJson(Map<String, dynamic> json) =
      _$ProjectHistoryImpl.fromJson;

  @override
  String? get step;
  @override
  String? get state;
  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  List<String>? get files;
  @override
  List<String>? get attachments;
  @override
  Metadata? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ProjectHistoryImplCopyWith<_$ProjectHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
