import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flame.freezed.dart';
part 'flame.g.dart';

@freezed
class Flame with _$Flame {
  const factory Flame({
    required int projectId,
    required int donationId,
    required String usages,
    required String inherenceName,
    required String image,
    required String randomMessage,
  }) = _Flame;
  factory Flame.fromJson(Map<String, dynamic> json) =>
      _$FlameFromJson(json);
}
