import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_project.freezed.dart';
part 'today_project.g.dart';

@freezed
class TodayProject with _$TodayProject {
  const factory TodayProject({
    required int projectId,
    required String imgUrl,
    required String title,
    required String usages,
    required String kind,
    required bool like,
    required List<String> userProfileImages,
    required int totalDonationCnt,
  }) = _TodayProject;
  factory TodayProject.fromJson(Map<String, dynamic> json) =>
      _$TodayProjectFromJson(json);
}
