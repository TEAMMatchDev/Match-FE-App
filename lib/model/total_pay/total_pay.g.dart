// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TotalPayImpl _$$TotalPayImplFromJson(Map<String, dynamic> json) =>
    _$TotalPayImpl(
      donationId: json['donationId'] as int,
      payDate: json['payDate'] as String,
      amount: json['amount'] as String,
      projectTitle: json['projectTitle'] as String,
      regularDate: json['regularDate'] as String,
      regularPayStatus: json['regularPayStatus'] as String,
    );

Map<String, dynamic> _$$TotalPayImplToJson(_$TotalPayImpl instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'payDate': instance.payDate,
      'amount': instance.amount,
      'projectTitle': instance.projectTitle,
      'regularDate': instance.regularDate,
      'regularPayStatus': instance.regularPayStatus,
    };
