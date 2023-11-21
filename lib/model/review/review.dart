import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required int executionId,
    required int donation,
    required int transparency,
    required int information,
    required String comment,
  }) = _Review;
  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);
}