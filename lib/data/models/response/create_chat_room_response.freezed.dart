// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_chat_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateChatRoomResponse _$CreateChatRoomResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateChatRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateChatRoomResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  List<Participant>? get participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateChatRoomResponseCopyWith<CreateChatRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChatRoomResponseCopyWith<$Res> {
  factory $CreateChatRoomResponseCopyWith(
    CreateChatRoomResponse value,
    $Res Function(CreateChatRoomResponse) then,
  ) = _$CreateChatRoomResponseCopyWithImpl<$Res, CreateChatRoomResponse>;
  @useResult
  $Res call({
    String? id,
    String? name,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    List<Participant>? participants,
  });
}

/// @nodoc
class _$CreateChatRoomResponseCopyWithImpl<
  $Res,
  $Val extends CreateChatRoomResponse
>
    implements $CreateChatRoomResponseCopyWith<$Res> {
  _$CreateChatRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? participants = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: freezed == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool?,
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
abstract class _$$CreateChatRoomResponseImplCopyWith<$Res>
    implements $CreateChatRoomResponseCopyWith<$Res> {
  factory _$$CreateChatRoomResponseImplCopyWith(
    _$CreateChatRoomResponseImpl value,
    $Res Function(_$CreateChatRoomResponseImpl) then,
  ) = __$$CreateChatRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? name,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    List<Participant>? participants,
  });
}

/// @nodoc
class __$$CreateChatRoomResponseImplCopyWithImpl<$Res>
    extends
        _$CreateChatRoomResponseCopyWithImpl<$Res, _$CreateChatRoomResponseImpl>
    implements _$$CreateChatRoomResponseImplCopyWith<$Res> {
  __$$CreateChatRoomResponseImplCopyWithImpl(
    _$CreateChatRoomResponseImpl _value,
    $Res Function(_$CreateChatRoomResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? participants = freezed,
  }) {
    return _then(
      _$CreateChatRoomResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: freezed == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
class _$CreateChatRoomResponseImpl implements _CreateChatRoomResponse {
  const _$CreateChatRoomResponseImpl({
    this.id,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    final List<Participant>? participants,
  }) : _participants = participants;

  factory _$CreateChatRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChatRoomResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? isActive;
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
    return 'CreateChatRoomResponse(id: $id, name: $name, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChatRoomResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    createdAt,
    updatedAt,
    isActive,
    const DeepCollectionEquality().hash(_participants),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChatRoomResponseImplCopyWith<_$CreateChatRoomResponseImpl>
  get copyWith =>
      __$$CreateChatRoomResponseImplCopyWithImpl<_$CreateChatRoomResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateChatRoomResponseImplToJson(this);
  }
}

abstract class _CreateChatRoomResponse implements CreateChatRoomResponse {
  const factory _CreateChatRoomResponse({
    final String? id,
    final String? name,
    final String? type,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final bool? isActive,
    final List<Participant>? participants,
  }) = _$CreateChatRoomResponseImpl;

  factory _CreateChatRoomResponse.fromJson(Map<String, dynamic> json) =
      _$CreateChatRoomResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get type;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get isActive;
  @override
  List<Participant>? get participants;
  @override
  @JsonKey(ignore: true)
  _$$CreateChatRoomResponseImplCopyWith<_$CreateChatRoomResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
