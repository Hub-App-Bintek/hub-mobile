// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_send_message_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatSendMessageRequest _$ChatSendMessageRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ChatSendMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatSendMessageRequest {
  String get content => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSendMessageRequestCopyWith<ChatSendMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSendMessageRequestCopyWith<$Res> {
  factory $ChatSendMessageRequestCopyWith(
    ChatSendMessageRequest value,
    $Res Function(ChatSendMessageRequest) then,
  ) = _$ChatSendMessageRequestCopyWithImpl<$Res, ChatSendMessageRequest>;
  @useResult
  $Res call({String content, String type});
}

/// @nodoc
class _$ChatSendMessageRequestCopyWithImpl<
  $Res,
  $Val extends ChatSendMessageRequest
>
    implements $ChatSendMessageRequestCopyWith<$Res> {
  _$ChatSendMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? type = null}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatSendMessageRequestImplCopyWith<$Res>
    implements $ChatSendMessageRequestCopyWith<$Res> {
  factory _$$ChatSendMessageRequestImplCopyWith(
    _$ChatSendMessageRequestImpl value,
    $Res Function(_$ChatSendMessageRequestImpl) then,
  ) = __$$ChatSendMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String type});
}

/// @nodoc
class __$$ChatSendMessageRequestImplCopyWithImpl<$Res>
    extends
        _$ChatSendMessageRequestCopyWithImpl<$Res, _$ChatSendMessageRequestImpl>
    implements _$$ChatSendMessageRequestImplCopyWith<$Res> {
  __$$ChatSendMessageRequestImplCopyWithImpl(
    _$ChatSendMessageRequestImpl _value,
    $Res Function(_$ChatSendMessageRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null, Object? type = null}) {
    return _then(
      _$ChatSendMessageRequestImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSendMessageRequestImpl implements _ChatSendMessageRequest {
  const _$ChatSendMessageRequestImpl({
    required this.content,
    this.type = 'text',
  });

  factory _$ChatSendMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSendMessageRequestImplFromJson(json);

  @override
  final String content;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'ChatSendMessageRequest(content: $content, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSendMessageRequestImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSendMessageRequestImplCopyWith<_$ChatSendMessageRequestImpl>
  get copyWith =>
      __$$ChatSendMessageRequestImplCopyWithImpl<_$ChatSendMessageRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSendMessageRequestImplToJson(this);
  }
}

abstract class _ChatSendMessageRequest implements ChatSendMessageRequest {
  const factory _ChatSendMessageRequest({
    required final String content,
    final String type,
  }) = _$ChatSendMessageRequestImpl;

  factory _ChatSendMessageRequest.fromJson(Map<String, dynamic> json) =
      _$ChatSendMessageRequestImpl.fromJson;

  @override
  String get content;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ChatSendMessageRequestImplCopyWith<_$ChatSendMessageRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
