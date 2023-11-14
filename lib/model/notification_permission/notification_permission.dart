import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_permission.freezed.dart';
part 'notification_permission.g.dart';

@freezed
class NotificationPermission with _$NotificationPermission {
  const factory NotificationPermission({
    required bool serviceAlarm,
    required bool eventAlarm,
  }) = _NotificationPermission;

  factory NotificationPermission.fromJson(Map<String, dynamic> json) =>
      _$NotificationPermissionFromJson(json);
}
