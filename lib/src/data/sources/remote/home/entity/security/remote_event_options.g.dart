// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_event_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEventsOptions _$RemoteEventsOptionsFromJson(Map<String, dynamic> json) =>
    RemoteEventsOptions(
      id: json['id'] as int?,
      name: json['name'] as String?,
      eventId: json['eventId'] as int?,
      isCalendar: json['isCalendar'] as bool?,
      isSelectedByUser: json['isSelectedByUser'] as bool?,
    );

Map<String, dynamic> _$RemoteEventsOptionsToJson(
        RemoteEventsOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'eventId': instance.eventId,
      'isCalendar': instance.isCalendar,
      'isSelectedByUser': instance.isSelectedByUser,
    };
