import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required int eventId,
    required String thumbnail,
    required String title,
    required String smallTitle,
    required String eventStatus,
    required String startDate,
    required String endDate,
  }) = _Event;
  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
}

@freezed
class EventInfo with _$EventInfo {
  const factory EventInfo({
    required int eventId,
    required String title,
    required String smallTitle,
    required String startDate,
    required String endDate,
  }) = _EventInfo;
  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);
}
