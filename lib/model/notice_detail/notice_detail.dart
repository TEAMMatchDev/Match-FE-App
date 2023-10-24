import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../notice/notice.dart';

part 'notice_detail.freezed.dart';
part 'notice_detail.g.dart';

@freezed
class NoticeDetail with _$NoticeDetail {
  const factory NoticeDetail({
    required Notice notifcieInfo,
    required List<NoticeContent> noticeContents,
  }) = _NoticeDetail;
  factory NoticeDetail.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailFromJson(json);
}

@freezed
class NoticeContent with _$NoticeContent {
  const factory NoticeContent({
    required int contentId,
    required String contentsType,
    required String cotents,
  }) = _NoticeContent;
  factory NoticeContent.fromJson(Map<String, dynamic> json) =>
      _$NoticeContentFromJson(json);
}
