// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TotalPay _$$_TotalPayFromJson(Map<String, dynamic> json) => _$_TotalPay(
      donationId: json['donationId'] as int,
      donationDate: json['donationDate'] as String,
      projectName: json['projectName'] as String,
      regularDate: json['regularDate'] as String,
      donationStatus: json['donationStatus'] as String,
      regularStatus: json['regularStatus'] as String,
    );

Map<String, dynamic> _$$_TotalPayToJson(_$_TotalPay instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'donationDate': instance.donationDate,
      'projectName': instance.projectName,
      'regularDate': instance.regularDate,
      'donationStatus': instance.donationStatus,
      'regularStatus': instance.regularStatus,
    };
