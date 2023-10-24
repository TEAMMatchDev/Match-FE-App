// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDetailImpl _$$EventDetailImplFromJson(Map<String, dynamic> json) =>
    _$EventDetailImpl(
      eventInfo: EventInfo.fromJson(json['eventInfo'] as Map<String, dynamic>),
      eventContents: (json['eventContents'] as List<dynamic>)
          .map((e) => Contents.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventDetailImplToJson(_$EventDetailImpl instance) =>
    <String, dynamic>{
      'eventInfo': instance.eventInfo,
      'eventContents': instance.eventContents,
    };
