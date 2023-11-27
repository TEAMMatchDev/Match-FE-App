// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendProjectImpl _$$RecommendProjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendProjectImpl(
      projectId: json['projectId'] as int,
      projectKind: json['projectKind'] as String,
      randomMessage: json['randomMessage'] as String,
    );

Map<String, dynamic> _$$RecommendProjectImplToJson(
        _$RecommendProjectImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'projectKind': instance.projectKind,
      'randomMessage': instance.randomMessage,
    };
