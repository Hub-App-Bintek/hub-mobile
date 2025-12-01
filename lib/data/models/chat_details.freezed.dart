// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatDetails _$ChatDetailsFromJson(Map<String, dynamic> json) {
  return _ChatDetails.fromJson(json);
}

/// @nodoc
mixin _$ChatDetails {
  String? get roomId => throw _privateConstructorUsedError;
  List<Participant>? get participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDetailsCopyWith<ChatDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDetailsCopyWith<$Res> {
  factory $ChatDetailsCopyWith(
    ChatDetails value,
    $Res Function(ChatDetails) then,
  ) = _$ChatDetailsCopyWithImpl<$Res, ChatDetails>;
  @useResult
  $Res call({String? roomId, List<Participant>? participants});
}

/// @nodoc
class _$ChatDetailsCopyWithImpl<$Res, $Val extends ChatDetails>
    implements $ChatDetailsCopyWith<$Res> {
  _$ChatDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = freezed, Object? participants = freezed}) {
    return _then(
      _value.copyWith(
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            participants: freezed == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<Participant>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatDetailsImplCopyWith<$Res>
    implements $ChatDetailsCopyWith<$Res> {
  factory _$$ChatDetailsImplCopyWith(
    _$ChatDetailsImpl value,
    $Res Function(_$ChatDetailsImpl) then,
  ) = __$$ChatDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? roomId, List<Participant>? participants});
}

/// @nodoc
class __$$ChatDetailsImplCopyWithImpl<$Res>
    extends _$ChatDetailsCopyWithImpl<$Res, _$ChatDetailsImpl>
    implements _$$ChatDetailsImplCopyWith<$Res> {
  __$$ChatDetailsImplCopyWithImpl(
    _$ChatDetailsImpl _value,
    $Res Function(_$ChatDetailsImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = freezed, Object? participants = freezed}) {
    return _then(
      _$ChatDetailsImpl(
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        participants: freezed == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<Participant>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDetailsImpl implements _ChatDetails {
  const _$ChatDetailsImpl({this.roomId, final List<Participant>? participants})
    : _participants = participants;

  factory _$ChatDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDetailsImplFromJson(json);

  @override
  final String? roomId;
  final List<Participant>? _participants;
  @override
  List<Participant>? get participants {
    final value = _participants;
    if (value == null) return null;
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatDetails(roomId: $roomId, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDetailsImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    const DeepCollectionEquality().hash(_participants),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDetailsImplCopyWith<_$ChatDetailsImpl> get copyWith =>
      __$$ChatDetailsImplCopyWithImpl<_$ChatDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDetailsImplToJson(this);
  }
}

abstract class _ChatDetails implements ChatDetails {
  const factory _ChatDetails({
    final String? roomId,
    final List<Participant>? participants,
  }) = _$ChatDetailsImpl;

  factory _ChatDetails.fromJson(Map<String, dynamic> json) =
      _$ChatDetailsImpl.fromJson;

  @override
  String? get roomId;
  @override
  List<Participant>? get participants;
  @override
  @JsonKey(ignore: true)
  _$$ChatDetailsImplCopyWith<_$ChatDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
