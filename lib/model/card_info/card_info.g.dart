// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardInfoImpl _$$CardInfoImplFromJson(Map<String, dynamic> json) =>
    _$CardInfoImpl(
      id: json['id'] as int,
      cardCode: json['cardCode'] as String,
      cardName: json['cardName'] as String?,
      cardNo: json['cardNo'] as String,
      cardAbleStatus: json['cardAbleStatus'] as String,
    );

Map<String, dynamic> _$$CardInfoImplToJson(_$CardInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardCode': instance.cardCode,
      'cardName': instance.cardName,
      'cardNo': instance.cardNo,
      'cardAbleStatus': instance.cardAbleStatus,
    };
