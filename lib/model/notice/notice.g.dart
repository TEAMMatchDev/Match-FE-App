// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeImpl _$$NoticeImplFromJson(Map<String, dynamic> json) => _$NoticeImpl(
      noticeId: json['noticeId'] as int,
      noticeType: json['noticeType'] as String,
      title: json['title'] as String,
      noticeDate: json['noticeDate'] as String,
    );

Map<String, dynamic> _$$NoticeImplToJson(_$NoticeImpl instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'noticeType': instance.noticeType,
      'title': instance.title,
      'noticeDate': instance.noticeDate,
    };
