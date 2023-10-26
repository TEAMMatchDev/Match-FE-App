// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchImpl _$$SearchImplFromJson(Map<String, dynamic> json) => _$SearchImpl(
      donationId: json['donationId'] as int,
      projectId: json['projectId'] as int,
      flameName: json['flameName'] as String,
      projectName: json['projectName'] as String,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$$SearchImplToJson(_$SearchImpl instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'projectId': instance.projectId,
      'flameName': instance.flameName,
      'projectName': instance.projectName,
      'imgUrl': instance.imgUrl,
    };
