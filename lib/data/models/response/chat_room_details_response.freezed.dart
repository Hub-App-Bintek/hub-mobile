// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatRoomDetailsResponse _$ChatRoomDetailsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ChatRoomDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomDetailsResponse {
  bool? get success => throw _privateConstructorUsedError;
  ChatRoomDetailsData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomDetailsResponseCopyWith<ChatRoomDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomDetailsResponseCopyWith<$Res> {
  factory $ChatRoomDetailsResponseCopyWith(
    ChatRoomDetailsResponse value,
    $Res Function(ChatRoomDetailsResponse) then,
  ) = _$ChatRoomDetailsResponseCopyWithImpl<$Res, ChatRoomDetailsResponse>;
  @useResult
  $Res call({bool? success, ChatRoomDetailsData? data});

  $ChatRoomDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChatRoomDetailsResponseCopyWithImpl<
  $Res,
  $Val extends ChatRoomDetailsResponse
>
    implements $ChatRoomDetailsResponseCopyWith<$Res> {
  _$ChatRoomDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = freezed, Object? data = freezed}) {
    return _then(
      _value.copyWith(
            success: freezed == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ChatRoomDetailsData?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatRoomDetailsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChatRoomDetailsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRoomDetailsResponseImplCopyWith<$Res>
    implements $ChatRoomDetailsResponseCopyWith<$Res> {
  factory _$$ChatRoomDetailsResponseImplCopyWith(
    _$ChatRoomDetailsResponseImpl value,
    $Res Function(_$ChatRoomDetailsResponseImpl) then,
  ) = __$$ChatRoomDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, ChatRoomDetailsData? data});

  @override
  $ChatRoomDetailsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChatRoomDetailsResponseImplCopyWithImpl<$Res>
    extends
        _$ChatRoomDetailsResponseCopyWithImpl<
          $Res,
          _$ChatRoomDetailsResponseImpl
        >
    implements _$$ChatRoomDetailsResponseImplCopyWith<$Res> {
  __$$ChatRoomDetailsResponseImplCopyWithImpl(
    _$ChatRoomDetailsResponseImpl _value,
    $Res Function(_$ChatRoomDetailsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = freezed, Object? data = freezed}) {
    return _then(
      _$ChatRoomDetailsResponseImpl(
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ChatRoomDetailsData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomDetailsResponseImpl implements _ChatRoomDetailsResponse {
  const _$ChatRoomDetailsResponseImpl({this.success, this.data});

  factory _$ChatRoomDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomDetailsResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final ChatRoomDetailsData? data;

  @override
  String toString() {
    return 'ChatRoomDetailsResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomDetailsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomDetailsResponseImplCopyWith<_$ChatRoomDetailsResponseImpl>
  get copyWith =>
      __$$ChatRoomDetailsResponseImplCopyWithImpl<
        _$ChatRoomDetailsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomDetailsResponseImplToJson(this);
  }
}

abstract class _ChatRoomDetailsResponse implements ChatRoomDetailsResponse {
  const factory _ChatRoomDetailsResponse({
    final bool? success,
    final ChatRoomDetailsData? data,
  }) = _$ChatRoomDetailsResponseImpl;

  factory _ChatRoomDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ChatRoomDetailsResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  ChatRoomDetailsData? get data;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomDetailsResponseImplCopyWith<_$ChatRoomDetailsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
