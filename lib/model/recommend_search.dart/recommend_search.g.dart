// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecommendSearch _$$_RecommendSearchFromJson(Map<String, dynamic> json) =>
    _$_RecommendSearch(
      keywordId: json['keywordId'] as int,
      priority: json['priority'] as int,
      keyword: json['keyword'] as String,
    );

Map<String, dynamic> _$$_RecommendSearchToJson(_$_RecommendSearch instance) =>
    <String, dynamic>{
      'keywordId': instance.keywordId,
      'priority': instance.priority,
      'keyword': instance.keyword,
    };
