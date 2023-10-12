import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_search.freezed.dart';
part 'recommend_search.g.dart';

@freezed
class RecommendSearch with _$RecommendSearch {
  const factory RecommendSearch({
    required int keywordId,
    required int priority,
    required String keyword,
  }) = _RecommendSearch;
  factory RecommendSearch.fromJson(Map<String, dynamic> json) =>
      _$RecommendSearchFromJson(json);
}
