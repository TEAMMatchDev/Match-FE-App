import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  const factory Notice({
    required int noticeId,
    required String noticeType,
    required String title,
    required String noticeDate,
  }) = _Notice;
  factory Notice.fromJson(Map<String, dynamic> json) =>
      _$NoticeFromJson(json);
}
