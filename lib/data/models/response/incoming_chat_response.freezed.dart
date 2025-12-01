// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incoming_chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IncomingChatResponse _$IncomingChatResponseFromJson(Map<String, dynamic> json) {
  return _IncomingChatResponse.fromJson(json);
}

/// @nodoc
mixin _$IncomingChatResponse {
  bool? get success => throw _privateConstructorUsedError;
  List<ChatData> get data => throw _privateConstructorUsedError;
  Pagination? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomingChatResponseCopyWith<IncomingChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomingChatResponseCopyWith<$Res> {
  factory $IncomingChatResponseCopyWith(
    IncomingChatResponse value,
    $Res Function(IncomingChatResponse) then,
  ) = _$IncomingChatResponseCopyWithImpl<$Res, IncomingChatResponse>;
  @useResult
  $Res call({bool? success, List<ChatData> data, Pagination? metadata});

  $PaginationCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$IncomingChatResponseCopyWithImpl<
  $Res,
  $Val extends IncomingChatResponse
>
    implements $IncomingChatResponseCopyWith<$Res> {
  _$IncomingChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool?,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<ChatData>,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Pagination?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IncomingChatResponseImplCopyWith<$Res>
    implements $IncomingChatResponseCopyWith<$Res> {
  factory _$$IncomingChatResponseImplCopyWith(
    _$IncomingChatResponseImpl value,
    $Res Function(_$IncomingChatResponseImpl) then,
  ) = __$$IncomingChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, List<ChatData> data, Pagination? metadata});

  @override
  $PaginationCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$IncomingChatResponseImplCopyWithImpl<$Res>
    extends _$IncomingChatResponseCopyWithImpl<$Res, _$IncomingChatResponseImpl>
    implements _$$IncomingChatResponseImplCopyWith<$Res> {
  __$$IncomingChatResponseImplCopyWithImpl(
    _$IncomingChatResponseImpl _value,
    $Res Function(_$IncomingChatResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$IncomingChatResponseImpl(
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool?,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<ChatData>,
        metadata: freezed == metadata
            ? _value.metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Pagination?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomingChatResponseImpl implements _IncomingChatResponse {
  const _$IncomingChatResponseImpl({
    this.success,
    final List<ChatData> data = const <ChatData>[],
    this.metadata,
  }) : _data = data;

  factory _$IncomingChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomingChatResponseImplFromJson(json);

  @override
  final bool? success;
  final List<ChatData> _data;
  @override
  @JsonKey()
  List<ChatData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Pagination? metadata;

  @override
  String toString() {
    return 'IncomingChatResponse(success: $success, data: $data, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomingChatResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    const DeepCollectionEquality().hash(_data),
    metadata,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomingChatResponseImplCopyWith<_$IncomingChatResponseImpl>
  get copyWith =>
      __$$IncomingChatResponseImplCopyWithImpl<_$IncomingChatResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomingChatResponseImplToJson(this);
  }
}

abstract class _IncomingChatResponse implements IncomingChatResponse {
  const factory _IncomingChatResponse({
    final bool? success,
    final List<ChatData> data,
    final Pagination? metadata,
  }) = _$IncomingChatResponseImpl;

  factory _IncomingChatResponse.fromJson(Map<String, dynamic> json) =
      _$IncomingChatResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  List<ChatData> get data;
  @override
  Pagination? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$IncomingChatResponseImplCopyWith<_$IncomingChatResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
