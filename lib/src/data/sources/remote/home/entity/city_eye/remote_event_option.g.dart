// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_event_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEventsOptions _$RemoteEventsOptionsFromJson(Map<String, dynamic> json) =>
    RemoteEventsOptions(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      eventId: json['eventId'] as int? ?? 0,
      isJoin: json['isJoin'] as bool? ?? false,
      isCalendar: json['isCalendar'] as bool? ?? false,
      isSelectedByUser: json['isSelectedByUser'] as bool? ?? false,
    );

Map<String, dynamic> _$RemoteEventsOptionsToJson(
        RemoteEventsOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'eventId': instance.eventId,
      'isJoin': instance.isJoin,
      'isCalendar': instance.isCalendar,
      'isSelectedByUser': instance.isSelectedByUser,
    };
