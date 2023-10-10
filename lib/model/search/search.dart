import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class Search with _$Search {
  const factory Search({
    required int donationId,
    required int projectId,
    required String flameName,
    required String projectName,
    required String imgUrl,
  }) = _Search;
  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}
