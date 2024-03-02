// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_badge_scanned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteBadgeScanned _$RemoteBadgeScannedFromJson(Map<String, dynamic> json) =>
    RemoteBadgeScanned(
      badge: json['badge'] == null
          ? null
          : RemoteBadge.fromJson(json['badge'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => RemoteServices.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventList: json['eventList'] == null
          ? null
          : RemoteEventList.fromJson(json['eventList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteBadgeScannedToJson(RemoteBadgeScanned instance) =>
    <String, dynamic>{
      'badge': instance.badge,
      'services': instance.services,
      'eventList': instance.eventList,
    };
