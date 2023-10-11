import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_search.freezed.dart';
part 'recent_search.g.dart';

@freezed
class RecentSearch with _$RecentSearch {
  const factory RecentSearch({
    required String name,
    required String title,
    required int donationId,
  }) = _RecentSearch;
  factory RecentSearch.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchFromJson(json);
}
