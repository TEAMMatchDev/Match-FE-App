// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationPermissionImpl _$$NotificationPermissionImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationPermissionImpl(
      serviceAlarm: json['serviceAlarm'] as bool,
      eventAlarm: json['eventAlarm'] as bool,
    );

Map<String, dynamic> _$$NotificationPermissionImplToJson(
        _$NotificationPermissionImpl instance) =>
    <String, dynamic>{
      'serviceAlarm': instance.serviceAlarm,
      'eventAlarm': instance.eventAlarm,
    };
