// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayImpl _$$PayImplFromJson(Map<String, dynamic> json) => _$PayImpl(
      payDate: json['payDate'] as String,
      payStatus: json['payStatus'] as String,
      payMethod: json['payMethod'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$PayImplToJson(_$PayImpl instance) => <String, dynamic>{
      'payDate': instance.payDate,
      'payStatus': instance.payStatus,
      'payMethod': instance.payMethod,
      'amount': instance.amount,
    };
