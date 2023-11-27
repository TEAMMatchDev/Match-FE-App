import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popup_info.freezed.dart';
part 'popup_info.g.dart';

@freezed
class PopupInfo with _$PopupInfo {
  const factory PopupInfo({
    required int executionId,
    required String regularStatus,
    required String title,
  }) = _PopupInfo;
  factory PopupInfo.fromJson(Map<String, dynamic> json) =>
      _$PopupInfoFromJson(json);
}