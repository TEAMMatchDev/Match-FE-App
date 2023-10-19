// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectDetail _$$_ProjectDetailFromJson(Map<String, dynamic> json) =>
    _$_ProjectDetail(
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

Map<String, dynamic> _$$_ProjectDetailToJson(_$_ProjectDetail instance) =>
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

_$_ProjectImage _$$_ProjectImageFromJson(Map<String, dynamic> json) =>
    _$_ProjectImage(
      imgId: json['imgId'] as int,
      imgUrl: json['imgUrl'] as String,
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$_ProjectImageToJson(_$_ProjectImage instance) =>
    <String, dynamic>{
      'imgId': instance.imgId,
      'imgUrl': instance.imgUrl,
      'sequence': instance.sequence,
    };
