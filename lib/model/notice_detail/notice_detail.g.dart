// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeDetailImpl _$$NoticeDetailImplFromJson(Map<String, dynamic> json) =>
    _$NoticeDetailImpl(
      noticeInfo: Notice.fromJson(json['noticeInfo'] as Map<String, dynamic>),
      noticeContents: (json['noticeContents'] as List<dynamic>)
          .map((e) => Contents.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NoticeDetailImplToJson(_$NoticeDetailImpl instance) =>
    <String, dynamic>{
      'noticeInfo': instance.noticeInfo,
      'noticeContents': instance.noticeContents,
    };
