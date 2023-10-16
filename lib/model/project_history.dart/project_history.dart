import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_history.freezed.dart';
part 'project_history.g.dart';

@freezed
class ProjectHistory with _$ProjectHistory {
  const factory ProjectHistory({
    required int historyId,
    required String historyStatus,
    required String histories,
    required String historyDate,
    required String profileImageUrl,
    required String nickname,
  }) = _ProjectHistory;
  factory ProjectHistory.fromJson(Map<String, dynamic> json) =>
      _$ProjectHistoryFromJson(json);
}
