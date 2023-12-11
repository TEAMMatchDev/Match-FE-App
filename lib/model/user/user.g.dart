// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      socialId: json['socialId'] as String?,
      email: json['email'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String,
      birthDate: json['birthDate'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'socialId': instance.socialId,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
    };
