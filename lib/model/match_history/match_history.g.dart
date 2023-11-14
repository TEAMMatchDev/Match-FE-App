// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchHistoryImpl _$$MatchHistoryImplFromJson(Map<String, dynamic> json) =>
    _$MatchHistoryImpl(
      historyId: json['historyId'] as int,
      historyStatus: json['historyStatus'] as String,
      histories: json['histories'] as String,
      historyDate: json['historyDate'] as String,
      flameImage: json['flameImage'] as String?,
      donationHistoryImages: (json['donationHistoryImages'] as List<dynamic>?)
          ?.map((e) => HistoryImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchHistoryImplToJson(_$MatchHistoryImpl instance) =>
    <String, dynamic>{
      'historyId': instance.historyId,
      'historyStatus': instance.historyStatus,
      'histories': instance.histories,
      'historyDate': instance.historyDate,
      'flameImage': instance.flameImage,
      'donationHistoryImages': instance.donationHistoryImages,
    };

_$HistoryImagesImpl _$$HistoryImagesImplFromJson(Map<String, dynamic> json) =>
    _$HistoryImagesImpl(
      imageId: json['imageId'] as int,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$HistoryImagesImplToJson(_$HistoryImagesImpl instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'imageUrl': instance.imageUrl,
    };
