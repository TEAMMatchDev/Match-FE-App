import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'donator.freezed.dart';
part 'donator.g.dart';

@freezed
class Donator with _$Donator {
  const factory Donator({
    required String name,
    required String birthDay,
    required String phoneNumber,
  }) = _Donator;
  factory Donator.fromJson(Map<String, dynamic> json) => _$DonatorFromJson(json);
}