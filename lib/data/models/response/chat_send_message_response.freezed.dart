// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_send_message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatSendMessageResponse _$ChatSendMessageResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ChatSendMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatSendMessageResponse {
  @JsonKey(readValue: _readMessageId)
  String? get messageId => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSendMessageResponseCopyWith<ChatSendMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSendMessageResponseCopyWith<$Res> {
  factory $ChatSendMessageResponseCopyWith(
    ChatSendMessageResponse value,
    $Res Function(ChatSendMessageResponse) then,
  ) = _$ChatSendMessageResponseCopyWithImpl<$Res, ChatSendMessageResponse>;
  @useResult
  $Res call({
    @JsonKey(readValue: _readMessageId) String? messageId,
    String? timestamp,
  });
}

/// @nodoc
class _$ChatSendMessageResponseCopyWithImpl<
  $Res,
  $Val extends ChatSendMessageResponse
>
    implements $ChatSendMessageResponseCopyWith<$Res> {
  _$ChatSendMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messageId = freezed, Object? timestamp = freezed}) {
    return _then(
      _value.copyWith(
            messageId: freezed == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatSendMessageResponseImplCopyWith<$Res>
    implements $ChatSendMessageResponseCopyWith<$Res> {
  factory _$$ChatSendMessageResponseImplCopyWith(
    _$ChatSendMessageResponseImpl value,
    $Res Function(_$ChatSendMessageResponseImpl) then,
  ) = __$$ChatSendMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(readValue: _readMessageId) String? messageId,
    String? timestamp,
  });
}

/// @nodoc
class __$$ChatSendMessageResponseImplCopyWithImpl<$Res>
    extends
        _$ChatSendMessageResponseCopyWithImpl<
          $Res,
          _$ChatSendMessageResponseImpl
        >
    implements _$$ChatSendMessageResponseImplCopyWith<$Res> {
  __$$ChatSendMessageResponseImplCopyWithImpl(
    _$ChatSendMessageResponseImpl _value,
    $Res Function(_$ChatSendMessageResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messageId = freezed, Object? timestamp = freezed}) {
    return _then(
      _$ChatSendMessageResponseImpl(
        messageId: freezed == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSendMessageResponseImpl implements _ChatSendMessageResponse {
  const _$ChatSendMessageResponseImpl({
    @JsonKey(readValue: _readMessageId) this.messageId,
    this.timestamp,
  });

  factory _$ChatSendMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSendMessageResponseImplFromJson(json);

  @override
  @JsonKey(readValue: _readMessageId)
  final String? messageId;
  @override
  final String? timestamp;

  @override
  String toString() {
    return 'ChatSendMessageResponse(messageId: $messageId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSendMessageResponseImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSendMessageResponseImplCopyWith<_$ChatSendMessageResponseImpl>
  get copyWith =>
      __$$ChatSendMessageResponseImplCopyWithImpl<
        _$ChatSendMessageResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSendMessageResponseImplToJson(this);
  }
}

abstract class _ChatSendMessageResponse implements ChatSendMessageResponse {
  const factory _ChatSendMessageResponse({
    @JsonKey(readValue: _readMessageId) final String? messageId,
    final String? timestamp,
  }) = _$ChatSendMessageResponseImpl;

  factory _ChatSendMessageResponse.fromJson(Map<String, dynamic> json) =
      _$ChatSendMessageResponseImpl.fromJson;

  @override
  @JsonKey(readValue: _readMessageId)
  String? get messageId;
  @override
  String? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ChatSendMessageResponseImplCopyWith<_$ChatSendMessageResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
