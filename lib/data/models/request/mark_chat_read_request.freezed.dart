// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_chat_read_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarkChatReadRequest _$MarkChatReadRequestFromJson(Map<String, dynamic> json) {
  return _MarkChatReadRequest.fromJson(json);
}

/// @nodoc
mixin _$MarkChatReadRequest {
  bool get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkChatReadRequestCopyWith<MarkChatReadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkChatReadRequestCopyWith<$Res> {
  factory $MarkChatReadRequestCopyWith(
    MarkChatReadRequest value,
    $Res Function(MarkChatReadRequest) then,
  ) = _$MarkChatReadRequestCopyWithImpl<$Res, MarkChatReadRequest>;
  @useResult
  $Res call({bool isRead});
}

/// @nodoc
class _$MarkChatReadRequestCopyWithImpl<$Res, $Val extends MarkChatReadRequest>
    implements $MarkChatReadRequestCopyWith<$Res> {
  _$MarkChatReadRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isRead = null}) {
    return _then(
      _value.copyWith(
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarkChatReadRequestImplCopyWith<$Res>
    implements $MarkChatReadRequestCopyWith<$Res> {
  factory _$$MarkChatReadRequestImplCopyWith(
    _$MarkChatReadRequestImpl value,
    $Res Function(_$MarkChatReadRequestImpl) then,
  ) = __$$MarkChatReadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRead});
}

/// @nodoc
class __$$MarkChatReadRequestImplCopyWithImpl<$Res>
    extends _$MarkChatReadRequestCopyWithImpl<$Res, _$MarkChatReadRequestImpl>
    implements _$$MarkChatReadRequestImplCopyWith<$Res> {
  __$$MarkChatReadRequestImplCopyWithImpl(
    _$MarkChatReadRequestImpl _value,
    $Res Function(_$MarkChatReadRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isRead = null}) {
    return _then(
      _$MarkChatReadRequestImpl(
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkChatReadRequestImpl implements _MarkChatReadRequest {
  const _$MarkChatReadRequestImpl({required this.isRead});

  factory _$MarkChatReadRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkChatReadRequestImplFromJson(json);

  @override
  final bool isRead;

  @override
  String toString() {
    return 'MarkChatReadRequest(isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkChatReadRequestImpl &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkChatReadRequestImplCopyWith<_$MarkChatReadRequestImpl> get copyWith =>
      __$$MarkChatReadRequestImplCopyWithImpl<_$MarkChatReadRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkChatReadRequestImplToJson(this);
  }
}

abstract class _MarkChatReadRequest implements MarkChatReadRequest {
  const factory _MarkChatReadRequest({required final bool isRead}) =
      _$MarkChatReadRequestImpl;

  factory _MarkChatReadRequest.fromJson(Map<String, dynamic> json) =
      _$MarkChatReadRequestImpl.fromJson;

  @override
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$$MarkChatReadRequestImplCopyWith<_$MarkChatReadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
