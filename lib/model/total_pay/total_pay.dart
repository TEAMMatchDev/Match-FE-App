import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_pay.freezed.dart';
part 'total_pay.g.dart';

@freezed
class TotalPay with _$TotalPay {
  const factory TotalPay({
    required int donationId,
    required String donationDate,
    required String projectName,
    required String regularDate,
    required String donationStatus,
    required String regularStatus,
  }) = _TotalPay;
  factory TotalPay.fromJson(Map<String, dynamic> json) =>
      _$TotalPayFromJson(json);
}
