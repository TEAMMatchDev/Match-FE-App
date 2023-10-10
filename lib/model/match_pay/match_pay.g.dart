// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchPay _$$_MatchPayFromJson(Map<String, dynamic> json) => _$_MatchPay(
      imgUrl: json['imgUrl'] as String,
      projectTitle: json['projectTitle'] as String,
      amount: json['amount'] as int,
      regularPayId: json['regularPayId'] as int,
      payDate: json['payDate'] as int,
    );

Map<String, dynamic> _$$_MatchPayToJson(_$_MatchPay instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'projectTitle': instance.projectTitle,
      'amount': instance.amount,
      'regularPayId': instance.regularPayId,
      'payDate': instance.payDate,
    };
