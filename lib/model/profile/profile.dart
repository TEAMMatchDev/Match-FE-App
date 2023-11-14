import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String profileImgUrl,
    String? name,
    required String nickName,
    required String socialType,
    String? email,
    required String phone,
  }) = _Profile;
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}
