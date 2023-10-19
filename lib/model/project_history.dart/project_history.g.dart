// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectHistory _$$_ProjectHistoryFromJson(Map<String, dynamic> json) =>
    _$_ProjectHistory(
      historyId: json['historyId'] as int,
      historyStatus: json['historyStatus'] as String,
      histories: json['histories'] as String,
      historyDate: json['historyDate'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$_ProjectHistoryToJson(_$_ProjectHistory instance) =>
    <String, dynamic>{
      'historyId': instance.historyId,
      'historyStatus': instance.historyStatus,
      'histories': instance.histories,
      'historyDate': instance.historyDate,
      'profileImageUrl': instance.profileImageUrl,
      'nickname': instance.nickname,
    };
