import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_pay.freezed.dart';
part 'match_pay.g.dart';

@freezed
class MatchPay with _$MatchPay {
  const factory MatchPay({
    required String imgUrl,
    required String projectTitle,
    required int amount,
    required int regularPayId,
    required int payDate,
  }) = _MatchPay;
  factory MatchPay.fromJson(Map<String, dynamic> json) =>
      _$MatchPayFromJson(json);
}
