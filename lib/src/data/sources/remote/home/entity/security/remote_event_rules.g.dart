// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_event_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEventsRules _$RemoteEventsRulesFromJson(Map<String, dynamic> json) =>
    RemoteEventsRules(
      id: json['id'] as int?,
      description: json['description'] as String?,
      eventId: json['eventId'] as int?,
    );

Map<String, dynamic> _$RemoteEventsRulesToJson(RemoteEventsRules instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'eventId': instance.eventId,
    };
