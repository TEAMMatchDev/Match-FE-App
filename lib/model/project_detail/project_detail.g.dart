// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDetailImpl _$$ProjectDetailImplFromJson(Map<String, dynamic> json) =>
    _$ProjectDetailImpl(
      projectId: json['projectId'] as int,
      thumbNail: json['thumbNail'] as String,
      projectImgList: (json['projectImgList'] as List<dynamic>)
          .map((e) => ProjectImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      usages: json['usages'] as String,
      kind: json['kind'] as String,
      regularStatus: json['regularStatus'] as String,
      like: json['like'] as bool,
      userProfileImages: (json['userProfileImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalDonationCnt: json['totalDonationCnt'] as int,
    );

Map<String, dynamic> _$$ProjectDetailImplToJson(_$ProjectDetailImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'thumbNail': instance.thumbNail,
      'projectImgList': instance.projectImgList,
      'title': instance.title,
      'usages': instance.usages,
      'kind': instance.kind,
      'regularStatus': instance.regularStatus,
      'like': instance.like,
      'userProfileImages': instance.userProfileImages,
      'totalDonationCnt': instance.totalDonationCnt,
    };

_$ProjectImageImpl _$$ProjectImageImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImageImpl(
      imgId: json['imgId'] as int,
      imgUrl: json['imgUrl'] as String,
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$ProjectImageImplToJson(_$ProjectImageImpl instance) =>
    <String, dynamic>{
      'imgId': instance.imgId,
      'imgUrl': instance.imgUrl,
      'sequence': instance.sequence,
    };
