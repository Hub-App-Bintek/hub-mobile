// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UnreadCountResponse _$UnreadCountResponseFromJson(Map<String, dynamic> json) {
  return _UnreadCountResponse.fromJson(json);
}

/// @nodoc
mixin _$UnreadCountResponse {
  int get unreadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnreadCountResponseCopyWith<UnreadCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadCountResponseCopyWith<$Res> {
  factory $UnreadCountResponseCopyWith(
    UnreadCountResponse value,
    $Res Function(UnreadCountResponse) then,
  ) = _$UnreadCountResponseCopyWithImpl<$Res, UnreadCountResponse>;
  @useResult
  $Res call({int unreadCount});
}

/// @nodoc
class _$UnreadCountResponseCopyWithImpl<$Res, $Val extends UnreadCountResponse>
    implements $UnreadCountResponseCopyWith<$Res> {
  _$UnreadCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? unreadCount = null}) {
    return _then(
      _value.copyWith(
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnreadCountResponseImplCopyWith<$Res>
    implements $UnreadCountResponseCopyWith<$Res> {
  factory _$$UnreadCountResponseImplCopyWith(
    _$UnreadCountResponseImpl value,
    $Res Function(_$UnreadCountResponseImpl) then,
  ) = __$$UnreadCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int unreadCount});
}

/// @nodoc
class __$$UnreadCountResponseImplCopyWithImpl<$Res>
    extends _$UnreadCountResponseCopyWithImpl<$Res, _$UnreadCountResponseImpl>
    implements _$$UnreadCountResponseImplCopyWith<$Res> {
  __$$UnreadCountResponseImplCopyWithImpl(
    _$UnreadCountResponseImpl _value,
    $Res Function(_$UnreadCountResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? unreadCount = null}) {
    return _then(
      _$UnreadCountResponseImpl(
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnreadCountResponseImpl implements _UnreadCountResponse {
  const _$UnreadCountResponseImpl({this.unreadCount = 0});

  factory _$UnreadCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadCountResponseImplFromJson(json);

  @override
  @JsonKey()
  final int unreadCount;

  @override
  String toString() {
    return 'UnreadCountResponse(unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountResponseImpl &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unreadCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountResponseImplCopyWith<_$UnreadCountResponseImpl> get copyWith =>
      __$$UnreadCountResponseImplCopyWithImpl<_$UnreadCountResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadCountResponseImplToJson(this);
  }
}

abstract class _UnreadCountResponse implements UnreadCountResponse {
  const factory _UnreadCountResponse({final int unreadCount}) =
      _$UnreadCountResponseImpl;

  factory _UnreadCountResponse.fromJson(Map<String, dynamic> json) =
      _$UnreadCountResponseImpl.fromJson;

  @override
  int get unreadCount;
  @override
  @JsonKey(ignore: true)
  _$$UnreadCountResponseImplCopyWith<_$UnreadCountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
