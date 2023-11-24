import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_flame.freezed.dart';
part 'tutorial_flame.g.dart';

@freezed
class TutorialFlame with _$TutorialFlame {
  const factory TutorialFlame({
    required int projectId,
    required String inherenceName,
    required String image,
    required String randomMessage,
  }) = _TutorialFlame;
  factory TutorialFlame.fromJson(Map<String, dynamic> json) =>
      _$TutorialFlameFromJson(json);
}
