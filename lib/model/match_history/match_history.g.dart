// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchHistory _$$_MatchHistoryFromJson(Map<String, dynamic> json) =>
    _$_MatchHistory(
      historyId: json['historyId'] as int,
      historyStatus: json['historyStatus'] as String,
      histories: json['histories'] as String,
      historyDate: json['historyDate'] as String,
      flameImage: json['flameImage'] as String?,
      donationHistoryImages: (json['donationHistoryImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_MatchHistoryToJson(_$_MatchHistory instance) =>
    <String, dynamic>{
      'historyId': instance.historyId,
      'historyStatus': instance.historyStatus,
      'histories': instance.histories,
      'historyDate': instance.historyDate,
      'flameImage': instance.flameImage,
      'donationHistoryImages': instance.donationHistoryImages,
    };