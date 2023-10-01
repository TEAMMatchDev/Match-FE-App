// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectDetail _$$_ProjectDetailFromJson(Map<String, dynamic> json) =>
    _$_ProjectDetail(
      projectId: json['projectId'] as int,
      projectImgList: (json['projectImgList'] as List<dynamic>)
          .map((e) => ProjectImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      usages: json['usages'] as String,
      donationAble: json['donationAble'] as bool,
      kind: json['kind'] as String,
      regularStatus: json['regularStatus'] as String,
    );

Map<String, dynamic> _$$_ProjectDetailToJson(_$_ProjectDetail instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'projectImgList': instance.projectImgList,
      'title': instance.title,
      'usages': instance.usages,
      'donationAble': instance.donationAble,
      'kind': instance.kind,
      'regularStatus': instance.regularStatus,
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
