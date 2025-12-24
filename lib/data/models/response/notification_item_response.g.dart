// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemResponseImpl _$$NotificationItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemResponseImpl(
  id: json['id'] as String?,
  notificationId: json['notificationId'] as String?,
  title: json['title'] as String?,
  message: json['message'] as String?,
  channel: json['channel'] as String?,
  template: json['template'] as String?,
  isRead: json['isRead'] as bool? ?? false,
  createdAt: json['createdAt'] as String?,
  readAt: json['readAt'] as String?,
);

Map<String, dynamic> _$$NotificationItemResponseImplToJson(
  _$NotificationItemResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'notificationId': instance.notificationId,
  'title': instance.title,
  'message': instance.message,
  'channel': instance.channel,
  'template': instance.template,
  'isRead': instance.isRead,
  'createdAt': instance.createdAt,
  'readAt': instance.readAt,
};
