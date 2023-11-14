// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      eventId: json['eventId'] as int,
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      smallTitle: json['smallTitle'] as String,
      eventStatus: json['eventStatus'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'smallTitle': instance.smallTitle,
      'eventStatus': instance.eventStatus,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_$EventInfoImpl _$$EventInfoImplFromJson(Map<String, dynamic> json) =>
    _$EventInfoImpl(
      eventId: json['eventId'] as int,
      title: json['title'] as String,
      smallTitle: json['smallTitle'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$EventInfoImplToJson(_$EventInfoImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'title': instance.title,
      'smallTitle': instance.smallTitle,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
