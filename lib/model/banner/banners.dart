import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banners.freezed.dart';
part 'banners.g.dart';

@freezed
class Banners with _$Banners {
  const factory Banners({
    required int bannerId,
    required String bannerType,
    required String bannerImg,
    int? eventId,
    required String contentsUrl,
  }) = _Banners;
  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);
}
