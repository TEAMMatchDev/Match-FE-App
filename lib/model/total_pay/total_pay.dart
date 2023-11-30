import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_pay.freezed.dart';
part 'total_pay.g.dart';

@freezed
class TotalPay with _$TotalPay {
  const factory TotalPay({
    required int donationId,
    required String payDate,
    required String amount,
    required String projectTitle,
    required String regularDate,
    required String regularPayStatus,
  }) = _TotalPay;
  factory TotalPay.fromJson(Map<String, dynamic> json) =>
      _$TotalPayFromJson(json);
}
