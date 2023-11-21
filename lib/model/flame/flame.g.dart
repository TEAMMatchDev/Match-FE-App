// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlameImpl _$$FlameImplFromJson(Map<String, dynamic> json) => _$FlameImpl(
      projectId: json['projectId'] as int,
      donationId: json['donationId'] as int,
      usages: json['usages'] as String,
      inherenceName: json['inherenceName'] as String,
      image: json['image'] as String,
      randomMessage: json['randomMessage'] as String,
    );

Map<String, dynamic> _$$FlameImplToJson(_$FlameImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'donationId': instance.donationId,
      'usages': instance.usages,
      'inherenceName': instance.inherenceName,
      'image': instance.image,
      'randomMessage': instance.randomMessage,
    };
