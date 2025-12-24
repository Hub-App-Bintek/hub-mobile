// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationPageResponse _$NotificationPageResponseFromJson(
  Map<String, dynamic> json,
) {
  return _NotificationPageResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationPageResponse {
  List<NotificationItemResponse> get notifications =>
      throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get hasPrevious => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPageResponseCopyWith<NotificationPageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPageResponseCopyWith<$Res> {
  factory $NotificationPageResponseCopyWith(
    NotificationPageResponse value,
    $Res Function(NotificationPageResponse) then,
  ) = _$NotificationPageResponseCopyWithImpl<$Res, NotificationPageResponse>;
  @useResult
  $Res call({
    List<NotificationItemResponse> notifications,
    int currentPage,
    int totalPages,
    int totalElements,
    int pageSize,
    bool hasNext,
    bool hasPrevious,
    int unreadCount,
  });
}

/// @nodoc
class _$NotificationPageResponseCopyWithImpl<
  $Res,
  $Val extends NotificationPageResponse
>
    implements $NotificationPageResponseCopyWith<$Res> {
  _$NotificationPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? pageSize = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
    Object? unreadCount = null,
  }) {
    return _then(
      _value.copyWith(
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as List<NotificationItemResponse>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            pageSize: null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int,
            hasNext: null == hasNext
                ? _value.hasNext
                : hasNext // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasPrevious: null == hasPrevious
                ? _value.hasPrevious
                : hasPrevious // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$NotificationPageResponseImplCopyWith<$Res>
    implements $NotificationPageResponseCopyWith<$Res> {
  factory _$$NotificationPageResponseImplCopyWith(
    _$NotificationPageResponseImpl value,
    $Res Function(_$NotificationPageResponseImpl) then,
  ) = __$$NotificationPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<NotificationItemResponse> notifications,
    int currentPage,
    int totalPages,
    int totalElements,
    int pageSize,
    bool hasNext,
    bool hasPrevious,
    int unreadCount,
  });
}

/// @nodoc
class __$$NotificationPageResponseImplCopyWithImpl<$Res>
    extends
        _$NotificationPageResponseCopyWithImpl<
          $Res,
          _$NotificationPageResponseImpl
        >
    implements _$$NotificationPageResponseImplCopyWith<$Res> {
  __$$NotificationPageResponseImplCopyWithImpl(
    _$NotificationPageResponseImpl _value,
    $Res Function(_$NotificationPageResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? pageSize = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
    Object? unreadCount = null,
  }) {
    return _then(
      _$NotificationPageResponseImpl(
        notifications: null == notifications
            ? _value._notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as List<NotificationItemResponse>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        hasNext: null == hasNext
            ? _value.hasNext
            : hasNext // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPrevious: null == hasPrevious
            ? _value.hasPrevious
            : hasPrevious // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$NotificationPageResponseImpl implements _NotificationPageResponse {
  const _$NotificationPageResponseImpl({
    final List<NotificationItemResponse> notifications =
        const <NotificationItemResponse>[],
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.pageSize = 0,
    this.hasNext = false,
    this.hasPrevious = false,
    this.unreadCount = 0,
  }) : _notifications = notifications;

  factory _$NotificationPageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationPageResponseImplFromJson(json);

  final List<NotificationItemResponse> _notifications;
  @override
  @JsonKey()
  List<NotificationItemResponse> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int totalElements;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final bool hasPrevious;
  @override
  @JsonKey()
  final int unreadCount;

  @override
  String toString() {
    return 'NotificationPageResponse(notifications: $notifications, currentPage: $currentPage, totalPages: $totalPages, totalElements: $totalElements, pageSize: $pageSize, hasNext: $hasNext, hasPrevious: $hasPrevious, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPageResponseImpl &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notifications),
    currentPage,
    totalPages,
    totalElements,
    pageSize,
    hasNext,
    hasPrevious,
    unreadCount,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPageResponseImplCopyWith<_$NotificationPageResponseImpl>
  get copyWith =>
      __$$NotificationPageResponseImplCopyWithImpl<
        _$NotificationPageResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationPageResponseImplToJson(this);
  }
}

abstract class _NotificationPageResponse implements NotificationPageResponse {
  const factory _NotificationPageResponse({
    final List<NotificationItemResponse> notifications,
    final int currentPage,
    final int totalPages,
    final int totalElements,
    final int pageSize,
    final bool hasNext,
    final bool hasPrevious,
    final int unreadCount,
  }) = _$NotificationPageResponseImpl;

  factory _NotificationPageResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationPageResponseImpl.fromJson;

  @override
  List<NotificationItemResponse> get notifications;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalElements;
  @override
  int get pageSize;
  @override
  bool get hasNext;
  @override
  bool get hasPrevious;
  @override
  int get unreadCount;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPageResponseImplCopyWith<_$NotificationPageResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
