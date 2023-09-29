import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay.freezed.dart';
part 'pay.g.dart';

@freezed
class Pay with _$Pay {
  const factory Pay({
    required String payDate,
    required String payStatus,
    required String payMethod,
    required String amount,
  }) = _Pay;
  factory Pay.fromJson(Map<String, dynamic> json) => _$PayFromJson(json);
}
