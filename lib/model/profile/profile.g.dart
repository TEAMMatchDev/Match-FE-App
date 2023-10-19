// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      profileImgUrl: json['profileImgUrl'] as String,
      name: json['name'] as String,
      socialType: json['socialType'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'profileImgUrl': instance.profileImgUrl,
      'name': instance.name,
      'socialType': instance.socialType,
      'email': instance.email,
      'phone': instance.phone,
    };
