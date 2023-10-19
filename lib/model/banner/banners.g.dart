// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannersImpl _$$BannersImplFromJson(Map<String, dynamic> json) =>
    _$BannersImpl(
      bannerId: json['bannerId'] as int,
      bannerType: json['bannerType'] as String,
      bannerImg: json['bannerImg'] as String,
      eventId: json['eventId'] as String?,
      contentsUrl: json['contentsUrl'] as String,
    );

Map<String, dynamic> _$$BannersImplToJson(_$BannersImpl instance) =>
    <String, dynamic>{
      'bannerId': instance.bannerId,
      'bannerType': instance.bannerType,
      'bannerImg': instance.bannerImg,
      'eventId': instance.eventId,
      'contentsUrl': instance.contentsUrl,
    };
