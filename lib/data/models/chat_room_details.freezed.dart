// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatRoomDetailsData _$ChatRoomDetailsDataFromJson(Map<String, dynamic> json) {
  return _ChatRoomDetailsData.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomDetailsData {
  String? get roomId => throw _privateConstructorUsedError;
  ChatDetails? get chatDetails => throw _privateConstructorUsedError;
  List<ChatMessage>? get messages => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomDetailsDataCopyWith<ChatRoomDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomDetailsDataCopyWith<$Res> {
  factory $ChatRoomDetailsDataCopyWith(
    ChatRoomDetailsData value,
    $Res Function(ChatRoomDetailsData) then,
  ) = _$ChatRoomDetailsDataCopyWithImpl<$Res, ChatRoomDetailsData>;
  @useResult
  $Res call({
    String? roomId,
    ChatDetails? chatDetails,
    List<ChatMessage>? messages,
    Pagination? pagination,
  });

  $ChatDetailsCopyWith<$Res>? get chatDetails;
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$ChatRoomDetailsDataCopyWithImpl<$Res, $Val extends ChatRoomDetailsData>
    implements $ChatRoomDetailsDataCopyWith<$Res> {
  _$ChatRoomDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = freezed,
    Object? chatDetails = freezed,
    Object? messages = freezed,
    Object? pagination = freezed,
  }) {
    return _then(
      _value.copyWith(
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            chatDetails: freezed == chatDetails
                ? _value.chatDetails
                : chatDetails // ignore: cast_nullable_to_non_nullable
                      as ChatDetails?,
            messages: freezed == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatMessage>?,
            pagination: freezed == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as Pagination?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatDetailsCopyWith<$Res>? get chatDetails {
    if (_value.chatDetails == null) {
      return null;
    }

    return $ChatDetailsCopyWith<$Res>(_value.chatDetails!, (value) {
      return _then(_value.copyWith(chatDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRoomDetailsDataImplCopyWith<$Res>
    implements $ChatRoomDetailsDataCopyWith<$Res> {
  factory _$$ChatRoomDetailsDataImplCopyWith(
    _$ChatRoomDetailsDataImpl value,
    $Res Function(_$ChatRoomDetailsDataImpl) then,
  ) = __$$ChatRoomDetailsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? roomId,
    ChatDetails? chatDetails,
    List<ChatMessage>? messages,
    Pagination? pagination,
  });

  @override
  $ChatDetailsCopyWith<$Res>? get chatDetails;
  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$ChatRoomDetailsDataImplCopyWithImpl<$Res>
    extends _$ChatRoomDetailsDataCopyWithImpl<$Res, _$ChatRoomDetailsDataImpl>
    implements _$$ChatRoomDetailsDataImplCopyWith<$Res> {
  __$$ChatRoomDetailsDataImplCopyWithImpl(
    _$ChatRoomDetailsDataImpl _value,
    $Res Function(_$ChatRoomDetailsDataImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = freezed,
    Object? chatDetails = freezed,
    Object? messages = freezed,
    Object? pagination = freezed,
  }) {
    return _then(
      _$ChatRoomDetailsDataImpl(
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatDetails: freezed == chatDetails
            ? _value.chatDetails
            : chatDetails // ignore: cast_nullable_to_non_nullable
                  as ChatDetails?,
        messages: freezed == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatMessage>?,
        pagination: freezed == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as Pagination?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomDetailsDataImpl implements _ChatRoomDetailsData {
  const _$ChatRoomDetailsDataImpl({
    this.roomId,
    this.chatDetails,
    final List<ChatMessage>? messages,
    this.pagination,
  }) : _messages = messages;

  factory _$ChatRoomDetailsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomDetailsDataImplFromJson(json);

  @override
  final String? roomId;
  @override
  final ChatDetails? chatDetails;
  final List<ChatMessage>? _messages;
  @override
  List<ChatMessage>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'ChatRoomDetailsData(roomId: $roomId, chatDetails: $chatDetails, messages: $messages, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomDetailsDataImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.chatDetails, chatDetails) ||
                other.chatDetails == chatDetails) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    chatDetails,
    const DeepCollectionEquality().hash(_messages),
    pagination,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomDetailsDataImplCopyWith<_$ChatRoomDetailsDataImpl> get copyWith =>
      __$$ChatRoomDetailsDataImplCopyWithImpl<_$ChatRoomDetailsDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomDetailsDataImplToJson(this);
  }
}

abstract class _ChatRoomDetailsData implements ChatRoomDetailsData {
  const factory _ChatRoomDetailsData({
    final String? roomId,
    final ChatDetails? chatDetails,
    final List<ChatMessage>? messages,
    final Pagination? pagination,
  }) = _$ChatRoomDetailsDataImpl;

  factory _ChatRoomDetailsData.fromJson(Map<String, dynamic> json) =
      _$ChatRoomDetailsDataImpl.fromJson;

  @override
  String? get roomId;
  @override
  ChatDetails? get chatDetails;
  @override
  List<ChatMessage>? get messages;
  @override
  Pagination? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomDetailsDataImplCopyWith<_$ChatRoomDetailsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
