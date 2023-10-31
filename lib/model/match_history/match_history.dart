import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_history.freezed.dart';
part 'match_history.g.dart';

@freezed
class MatchHistory with _$MatchHistory {
  const factory MatchHistory({
    required int historyId,
    required String historyStatus,
    required String histories,
    required String historyDate,
    String? flameImage,
    List<HistoryImages>? donationHistoryImages,
  }) = _MatchHistory;
  factory MatchHistory.fromJson(Map<String, dynamic> json) =>
      _$MatchHistoryFromJson(json);
}
@freezed
class HistoryImages with _$HistoryImages {
  const factory HistoryImages({
    required int imageId,
    required String imageUrl,
  }) = _HistoryImages;
  factory HistoryImages.fromJson(Map<String, dynamic> json) =>
      _$HistoryImagesFromJson(json);
}

