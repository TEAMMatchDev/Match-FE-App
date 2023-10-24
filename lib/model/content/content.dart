import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Contents with _$Contents {
  const factory Contents({
    required int contentId,
    required String contentsType,
    required String contents,
  }) = _Contents;
  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);
}