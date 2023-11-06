import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_info.freezed.dart';
part 'card_info.g.dart';

@freezed
class CardInfo with _$CardInfo {
  const factory CardInfo({
    required int id,
    required String cardCode,
    required String? cardName,
    required String cardNo,
    required String cardAbleStatus,
  }) = _CardInfo;
  factory CardInfo.fromJson(Map<String, dynamic> json) => _$CardInfoFromJson(json);
}