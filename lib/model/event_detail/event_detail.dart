import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../content/content.dart';
import '../event/event.dart';

part 'event_detail.freezed.dart';
part 'event_detail.g.dart';

@freezed
class EventDetail with _$EventDetail {
  const factory EventDetail({
    required EventInfo eventInfo,
    required List<Contents> eventContents,
  }) = _EventDetail;
  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);
}
