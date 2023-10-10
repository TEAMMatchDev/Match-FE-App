// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiError _$$_ApiErrorFromJson(Map<String, dynamic> json) => _$_ApiError(
      isSuccess: json['isSuccess'] as bool,
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_ApiErrorToJson(_$_ApiError instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'code': instance.code,
      'message': instance.message,
    };
