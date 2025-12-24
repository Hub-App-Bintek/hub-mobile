// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_notifications_read_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarkNotificationsReadRequest _$MarkNotificationsReadRequestFromJson(
  Map<String, dynamic> json,
) {
  return _MarkNotificationsReadRequest.fromJson(json);
}

/// @nodoc
mixin _$MarkNotificationsReadRequest {
  List<String>? get notificationIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkNotificationsReadRequestCopyWith<MarkNotificationsReadRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkNotificationsReadRequestCopyWith<$Res> {
  factory $MarkNotificationsReadRequestCopyWith(
    MarkNotificationsReadRequest value,
    $Res Function(MarkNotificationsReadRequest) then,
  ) =
      _$MarkNotificationsReadRequestCopyWithImpl<
        $Res,
        MarkNotificationsReadRequest
      >;
  @useResult
  $Res call({List<String>? notificationIds});
}

/// @nodoc
class _$MarkNotificationsReadRequestCopyWithImpl<
  $Res,
  $Val extends MarkNotificationsReadRequest
>
    implements $MarkNotificationsReadRequestCopyWith<$Res> {
  _$MarkNotificationsReadRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notificationIds = freezed}) {
    return _then(
      _value.copyWith(
            notificationIds: freezed == notificationIds
                ? _value.notificationIds
                : notificationIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarkNotificationsReadRequestImplCopyWith<$Res>
    implements $MarkNotificationsReadRequestCopyWith<$Res> {
  factory _$$MarkNotificationsReadRequestImplCopyWith(
    _$MarkNotificationsReadRequestImpl value,
    $Res Function(_$MarkNotificationsReadRequestImpl) then,
  ) = __$$MarkNotificationsReadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? notificationIds});
}

/// @nodoc
class __$$MarkNotificationsReadRequestImplCopyWithImpl<$Res>
    extends
        _$MarkNotificationsReadRequestCopyWithImpl<
          $Res,
          _$MarkNotificationsReadRequestImpl
        >
    implements _$$MarkNotificationsReadRequestImplCopyWith<$Res> {
  __$$MarkNotificationsReadRequestImplCopyWithImpl(
    _$MarkNotificationsReadRequestImpl _value,
    $Res Function(_$MarkNotificationsReadRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notificationIds = freezed}) {
    return _then(
      _$MarkNotificationsReadRequestImpl(
        notificationIds: freezed == notificationIds
            ? _value._notificationIds
            : notificationIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkNotificationsReadRequestImpl
    implements _MarkNotificationsReadRequest {
  const _$MarkNotificationsReadRequestImpl({
    final List<String>? notificationIds,
  }) : _notificationIds = notificationIds;

  factory _$MarkNotificationsReadRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$MarkNotificationsReadRequestImplFromJson(json);

  final List<String>? _notificationIds;
  @override
  List<String>? get notificationIds {
    final value = _notificationIds;
    if (value == null) return null;
    if (_notificationIds is EqualUnmodifiableListView) return _notificationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MarkNotificationsReadRequest(notificationIds: $notificationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkNotificationsReadRequestImpl &&
            const DeepCollectionEquality().equals(
              other._notificationIds,
              _notificationIds,
            ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notificationIds),
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkNotificationsReadRequestImplCopyWith<
    _$MarkNotificationsReadRequestImpl
  >
  get copyWith =>
      __$$MarkNotificationsReadRequestImplCopyWithImpl<
        _$MarkNotificationsReadRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkNotificationsReadRequestImplToJson(this);
  }
}

abstract class _MarkNotificationsReadRequest
    implements MarkNotificationsReadRequest {
  const factory _MarkNotificationsReadRequest({
    final List<String>? notificationIds,
  }) = _$MarkNotificationsReadRequestImpl;

  factory _MarkNotificationsReadRequest.fromJson(Map<String, dynamic> json) =
      _$MarkNotificationsReadRequestImpl.fromJson;

  @override
  List<String>? get notificationIds;
  @override
  @JsonKey(ignore: true)
  _$$MarkNotificationsReadRequestImplCopyWith<
    _$MarkNotificationsReadRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
