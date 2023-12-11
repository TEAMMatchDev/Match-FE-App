// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      projectId: json['projectId'] as int,
      imgUrl: json['imgUrl'] as String,
      title: json['title'] as String,
      usages: json['usages'] as String,
      kind: json['kind'] as String,
      like: json['like'] as bool,
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'usages': instance.usages,
      'kind': instance.kind,
      'like': instance.like,
    };
