// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotalPayImpl _$$TotalPayImplFromJson(Map<String, dynamic> json) =>
    _$TotalPayImpl(
      regularId: json['regularId'] as int,
      projectTitle: json['projectTitle'] as String,
      regularDate: json['regularDate'] as String,
      regularPayStatus: json['regularPayStatus'] as String,
      payDate: json['payDate'] as int,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$$TotalPayImplToJson(_$TotalPayImpl instance) =>
    <String, dynamic>{
      'regularId': instance.regularId,
      'projectTitle': instance.projectTitle,
      'regularDate': instance.regularDate,
      'regularPayStatus': instance.regularPayStatus,
      'payDate': instance.payDate,
      'amount': instance.amount,
    };
