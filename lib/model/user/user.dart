import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? socialId,
    required String email,
    String? name,
    String? phone,
    required String gender,
    String? birthDate,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}