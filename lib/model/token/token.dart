import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required int userId,
    required String accessToken,
    required String refreshToken,
    @JsonKey(name: 'new')required bool isTutorial,
  }) = _Token;
  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);
}