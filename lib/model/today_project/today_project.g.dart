// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayProjectImpl _$$TodayProjectImplFromJson(Map<String, dynamic> json) =>
    _$TodayProjectImpl(
      projectId: json['projectId'] as int,
      imgUrl: json['imgUrl'] as String,
      title: json['title'] as String,
      usages: json['usages'] as String,
      kind: json['kind'] as String,
      like: json['like'] as bool,
      userProfileImages: (json['userProfileImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalDonationCnt: json['totalDonationCnt'] as int,
    );

Map<String, dynamic> _$$TodayProjectImplToJson(_$TodayProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'usages': instance.usages,
      'kind': instance.kind,
      'like': instance.like,
      'userProfileImages': instance.userProfileImages,
      'totalDonationCnt': instance.totalDonationCnt,
    };
