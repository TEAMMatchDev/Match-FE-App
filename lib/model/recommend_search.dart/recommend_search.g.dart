// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendSearchImpl _$$RecommendSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendSearchImpl(
      keywordId: json['keywordId'] as int,
      priority: json['priority'] as int,
      keyword: json['keyword'] as String,
    );

Map<String, dynamic> _$$RecommendSearchImplToJson(
        _$RecommendSearchImpl instance) =>
    <String, dynamic>{
      'keywordId': instance.keywordId,
      'priority': instance.priority,
      'keyword': instance.keyword,
    };
