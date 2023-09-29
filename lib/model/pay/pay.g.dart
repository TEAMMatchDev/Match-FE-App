// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pay _$$_PayFromJson(Map<String, dynamic> json) => _$_Pay(
      payDate: json['payDate'] as String,
      payStatus: json['payStatus'] as String,
      payMethod: json['payMethod'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$_PayToJson(_$_Pay instance) => <String, dynamic>{
      'payDate': instance.payDate,
      'payStatus': instance.payStatus,
      'payMethod': instance.payMethod,
      'amount': instance.amount,
    };
