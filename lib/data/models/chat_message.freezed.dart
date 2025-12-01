// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String? get id => throw _privateConstructorUsedError;
  String? get chatRoomId => throw _privateConstructorUsedError;
  int? get senderId => throw _privateConstructorUsedError;
  int? get receiverId => throw _privateConstructorUsedError;
  String? get messageType => throw _privateConstructorUsedError;
  String? get messageContent => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String? id,
    String? chatRoomId,
    int? senderId,
    int? receiverId,
    String? messageType,
    String? messageContent,
    String? fileUrl,
    bool? isRead,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatRoomId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
    Object? messageType = freezed,
    Object? messageContent = freezed,
    Object? fileUrl = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            chatRoomId: freezed == chatRoomId
                ? _value.chatRoomId
                : chatRoomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            senderId: freezed == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            receiverId: freezed == receiverId
                ? _value.receiverId
                : receiverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            messageType: freezed == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageContent: freezed == messageContent
                ? _value.messageContent
                : messageContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRead: freezed == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? chatRoomId,
    int? senderId,
    int? receiverId,
    String? messageType,
    String? messageContent,
    String? fileUrl,
    bool? isRead,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatRoomId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
    Object? messageType = freezed,
    Object? messageContent = freezed,
    Object? fileUrl = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$ChatMessageImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatRoomId: freezed == chatRoomId
            ? _value.chatRoomId
            : chatRoomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        senderId: freezed == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        receiverId: freezed == receiverId
            ? _value.receiverId
            : receiverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        messageType: freezed == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageContent: freezed == messageContent
            ? _value.messageContent
            : messageContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRead: freezed == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    this.id,
    this.chatRoomId,
    this.senderId,
    this.receiverId,
    this.messageType,
    this.messageContent,
    this.fileUrl,
    this.isRead,
    this.createdAt,
  });

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String? id;
  @override
  final String? chatRoomId;
  @override
  final int? senderId;
  @override
  final int? receiverId;
  @override
  final String? messageType;
  @override
  final String? messageContent;
  @override
  final String? fileUrl;
  @override
  final bool? isRead;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ChatMessage(id: $id, chatRoomId: $chatRoomId, senderId: $senderId, receiverId: $receiverId, messageType: $messageType, messageContent: $messageContent, fileUrl: $fileUrl, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.messageContent, messageContent) ||
                other.messageContent == messageContent) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    chatRoomId,
    senderId,
    receiverId,
    messageType,
    messageContent,
    fileUrl,
    isRead,
    createdAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    final String? id,
    final String? chatRoomId,
    final int? senderId,
    final int? receiverId,
    final String? messageType,
    final String? messageContent,
    final String? fileUrl,
    final bool? isRead,
    final DateTime? createdAt,
  }) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String? get id;
  @override
  String? get chatRoomId;
  @override
  int? get senderId;
  @override
  int? get receiverId;
  @override
  String? get messageType;
  @override
  String? get messageContent;
  @override
  String? get fileUrl;
  @override
  bool? get isRead;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
