// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationPageResponseImpl _$$NotificationPageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationPageResponseImpl(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map(
            (e) => NotificationItemResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <NotificationItemResponse>[],
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
  hasNext: json['hasNext'] as bool? ?? false,
  hasPrevious: json['hasPrevious'] as bool? ?? false,
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$NotificationPageResponseImplToJson(
  _$NotificationPageResponseImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'currentPage': instance.currentPage,
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
  'pageSize': instance.pageSize,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
  'unreadCount': instance.unreadCount,
};
