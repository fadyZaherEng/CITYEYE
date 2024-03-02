// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_event_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEventList _$RemoteEventListFromJson(Map<String, dynamic> json) =>
    RemoteEventList(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => RemoteEvents.fromJson(e as Map<String, dynamic>))
          .toList(),
      extraFieldEvents: (json['extraFieldEvents'] as List<dynamic>?)
          ?.map(
              (e) => RemoteExtraFieldEvents.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteEventListToJson(RemoteEventList instance) =>
    <String, dynamic>{
      'events': instance.events,
      'extraFieldEvents': instance.extraFieldEvents,
    };
