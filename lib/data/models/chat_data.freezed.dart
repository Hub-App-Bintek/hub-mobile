// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatData _$ChatDataFromJson(Map<String, dynamic> json) {
  return _ChatData.fromJson(json);
}

/// @nodoc
mixin _$ChatData {
  String? get roomId => throw _privateConstructorUsedError;
  Sender? get sender => throw _privateConstructorUsedError;
  String? get messagePreview => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get chatType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDataCopyWith<ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataCopyWith<$Res> {
  factory $ChatDataCopyWith(ChatData value, $Res Function(ChatData) then) =
      _$ChatDataCopyWithImpl<$Res, ChatData>;
  @useResult
  $Res call({
    String? roomId,
    Sender? sender,
    String? messagePreview,
    String? timestamp,
    bool? read,
    String? priority,
    String? chatType,
  });

  $SenderCopyWith<$Res>? get sender;
}

/// @nodoc
class _$ChatDataCopyWithImpl<$Res, $Val extends ChatData>
    implements $ChatDataCopyWith<$Res> {
  _$ChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = freezed,
    Object? sender = freezed,
    Object? messagePreview = freezed,
    Object? timestamp = freezed,
    Object? read = freezed,
    Object? priority = freezed,
    Object? chatType = freezed,
  }) {
    return _then(
      _value.copyWith(
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sender: freezed == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as Sender?,
            messagePreview: freezed == messagePreview
                ? _value.messagePreview
                : messagePreview // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String?,
            read: freezed == read
                ? _value.read
                : read // ignore: cast_nullable_to_non_nullable
                      as bool?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String?,
            chatType: freezed == chatType
                ? _value.chatType
                : chatType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $SenderCopyWith<$Res>? get sender {
    if (_value.sender == null) {
      return null;
    }

    return $SenderCopyWith<$Res>(_value.sender!, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatDataImplCopyWith<$Res>
    implements $ChatDataCopyWith<$Res> {
  factory _$$ChatDataImplCopyWith(
    _$ChatDataImpl value,
    $Res Function(_$ChatDataImpl) then,
  ) = __$$ChatDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? roomId,
    Sender? sender,
    String? messagePreview,
    String? timestamp,
    bool? read,
    String? priority,
    String? chatType,
  });

  @override
  $SenderCopyWith<$Res>? get sender;
}

/// @nodoc
class __$$ChatDataImplCopyWithImpl<$Res>
    extends _$ChatDataCopyWithImpl<$Res, _$ChatDataImpl>
    implements _$$ChatDataImplCopyWith<$Res> {
  __$$ChatDataImplCopyWithImpl(
    _$ChatDataImpl _value,
    $Res Function(_$ChatDataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = freezed,
    Object? sender = freezed,
    Object? messagePreview = freezed,
    Object? timestamp = freezed,
    Object? read = freezed,
    Object? priority = freezed,
    Object? chatType = freezed,
  }) {
    return _then(
      _$ChatDataImpl(
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sender: freezed == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as Sender?,
        messagePreview: freezed == messagePreview
            ? _value.messagePreview
            : messagePreview // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String?,
        read: freezed == read
            ? _value.read
            : read // ignore: cast_nullable_to_non_nullable
                  as bool?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatType: freezed == chatType
            ? _value.chatType
            : chatType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDataImpl implements _ChatData {
  const _$ChatDataImpl({
    this.roomId,
    this.sender,
    this.messagePreview,
    this.timestamp,
    this.read,
    this.priority,
    this.chatType,
  });

  factory _$ChatDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDataImplFromJson(json);

  @override
  final String? roomId;
  @override
  final Sender? sender;
  @override
  final String? messagePreview;
  @override
  final String? timestamp;
  @override
  final bool? read;
  @override
  final String? priority;
  @override
  final String? chatType;

  @override
  String toString() {
    return 'ChatData(roomId: $roomId, sender: $sender, messagePreview: $messagePreview, timestamp: $timestamp, read: $read, priority: $priority, chatType: $chatType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDataImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.messagePreview, messagePreview) ||
                other.messagePreview == messagePreview) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    sender,
    messagePreview,
    timestamp,
    read,
    priority,
    chatType,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      __$$ChatDataImplCopyWithImpl<_$ChatDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDataImplToJson(this);
  }
}

abstract class _ChatData implements ChatData {
  const factory _ChatData({
    final String? roomId,
    final Sender? sender,
    final String? messagePreview,
    final String? timestamp,
    final bool? read,
    final String? priority,
    final String? chatType,
  }) = _$ChatDataImpl;

  factory _ChatData.fromJson(Map<String, dynamic> json) =
      _$ChatDataImpl.fromJson;

  @override
  String? get roomId;
  @override
  Sender? get sender;
  @override
  String? get messagePreview;
  @override
  String? get timestamp;
  @override
  bool? get read;
  @override
  String? get priority;
  @override
  String? get chatType;
  @override
  @JsonKey(ignore: true)
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
