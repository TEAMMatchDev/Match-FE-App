import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flame_detail.freezed.dart';
part 'flame_detail.g.dart';

@freezed
class FlameDetail with _$FlameDetail {
  const factory FlameDetail({
    required String imgUrl,
    required String flameType,
    required String inherenceName,
    required String usages,
    required int amount,
    required int sequence,
    required String randomMessage
  }) = _FlameDetail;

  factory FlameDetail.fromJson(Map<String, dynamic> json) =>
      _$FlameDetailFromJson(json);
}
