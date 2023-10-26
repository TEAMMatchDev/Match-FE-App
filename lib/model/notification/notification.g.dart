// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      notificationId: json['notificationId'] as int,
      notificationsType: json['notificationsType'] as String,
      title: json['title'] as String,
      notificationsDate: json['notificationsDate'] as String,
      read: json['read'] as bool,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationsType': instance.notificationsType,
      'title': instance.title,
      'notificationsDate': instance.notificationsDate,
      'read': instance.read,
    };
