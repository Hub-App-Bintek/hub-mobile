// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_notifications_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkNotificationsReadRequestImpl _$$MarkNotificationsReadRequestImplFromJson(
  Map<String, dynamic> json,
) => _$MarkNotificationsReadRequestImpl(
  notificationIds: (json['notificationIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$MarkNotificationsReadRequestImplToJson(
  _$MarkNotificationsReadRequestImpl instance,
) => <String, dynamic>{'notificationIds': instance.notificationIds};
