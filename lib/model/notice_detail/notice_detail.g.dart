// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeDetailImpl _$$NoticeDetailImplFromJson(Map<String, dynamic> json) =>
    _$NoticeDetailImpl(
      notifcieInfo:
          Notice.fromJson(json['notifcieInfo'] as Map<String, dynamic>),
      noticeContents: (json['noticeContents'] as List<dynamic>)
          .map((e) => NoticeContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NoticeDetailImplToJson(_$NoticeDetailImpl instance) =>
    <String, dynamic>{
      'notifcieInfo': instance.notifcieInfo,
      'noticeContents': instance.noticeContents,
    };

_$NoticeContentImpl _$$NoticeContentImplFromJson(Map<String, dynamic> json) =>
    _$NoticeContentImpl(
      contentId: json['contentId'] as int,
      contentsType: json['contentsType'] as String,
      cotents: json['cotents'] as String,
    );

Map<String, dynamic> _$$NoticeContentImplToJson(_$NoticeContentImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentsType': instance.contentsType,
      'cotents': instance.cotents,
    };
