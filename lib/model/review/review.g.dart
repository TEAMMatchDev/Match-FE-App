// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      executionId: json['executionId'] as int,
      donation: json['donation'] as int,
      transparency: json['transparency'] as int,
      information: json['information'] as int,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'executionId': instance.executionId,
      'donation': instance.donation,
      'transparency': instance.transparency,
      'information': instance.information,
      'comment': instance.comment,
    };
