// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flame_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlameDetail _$$_FlameDetailFromJson(Map<String, dynamic> json) =>
    _$_FlameDetail(
      imgUrl: json['imgUrl'] as String,
      flameType: json['flameType'] as String,
      inherenceName: json['inherenceName'] as String,
      usages: json['usages'] as String,
      amount: json['amount'] as int,
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$_FlameDetailToJson(_$_FlameDetail instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'flameType': instance.flameType,
      'inherenceName': instance.inherenceName,
      'usages': instance.usages,
      'amount': instance.amount,
      'sequence': instance.sequence,
    };
