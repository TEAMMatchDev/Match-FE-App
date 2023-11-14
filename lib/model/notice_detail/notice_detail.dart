import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:match/model/content/content.dart';
import '../notice/notice.dart';

part 'notice_detail.freezed.dart';
part 'notice_detail.g.dart';

@freezed
class NoticeDetail with _$NoticeDetail {
  const factory NoticeDetail({
    required Notice noticeInfo,
    required List<Contents> noticeContents,
  }) = _NoticeDetail;
  factory NoticeDetail.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailFromJson(json);
}

