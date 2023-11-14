// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flame_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlameDetailImpl _$$FlameDetailImplFromJson(Map<String, dynamic> json) =>
    _$FlameDetailImpl(
      imgUrl: json['imgUrl'] as String,
      flameType: json['flameType'] as String,
      inherenceName: json['inherenceName'] as String,
      usages: json['usages'] as String,
      amount: json['amount'] as int,
      sequence: json['sequence'] as int,
      randomMessage: json['randomMessage'] as String,
    );

Map<String, dynamic> _$$FlameDetailImplToJson(_$FlameDetailImpl instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'flameType': instance.flameType,
      'inherenceName': instance.inherenceName,
      'usages': instance.usages,
      'amount': instance.amount,
      'sequence': instance.sequence,
      'randomMessage': instance.randomMessage,
    };
