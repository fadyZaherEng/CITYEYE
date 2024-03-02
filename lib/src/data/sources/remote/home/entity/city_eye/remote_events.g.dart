// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEvents _$RemoteEventsFromJson(Map<String, dynamic> json) => RemoteEvents(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
      openingDate: json['openingDate'] as String? ?? "",
      closedDate: json['closedDate'] as String? ?? "",
      isPaid: json['isPaid'] as bool? ?? false,
      maxCountJoin: json['maxCountJoin'] as int? ?? 0,
      memberCount: json['memberCount'] as int? ?? 0,
      locationAddress: json['locationAddress'] as String? ?? "",
      locationLatitude: json['locationLatitude'] as String? ?? "",
      locationLongitude: json['locationLongitude'] as String? ?? "",
      transactionId: json['transactionId'] as int? ?? 0,
      eventsOptions: (json['eventsOptions'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteEventsOptions.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      eventsRules: (json['eventsRules'] as List<dynamic>?)
              ?.map(
                  (e) => RemoteEventsRules.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      eventsAttachments:
          json['eventsAttachments'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$RemoteEventsToJson(RemoteEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'openingDate': instance.openingDate,
      'closedDate': instance.closedDate,
      'isPaid': instance.isPaid,
      'maxCountJoin': instance.maxCountJoin,
      'memberCount': instance.memberCount,
      'locationAddress': instance.locationAddress,
      'locationLatitude': instance.locationLatitude,
      'locationLongitude': instance.locationLongitude,
      'transactionId': instance.transactionId,
      'eventsOptions': instance.eventsOptions,
      'eventsRules': instance.eventsRules,
      'eventsAttachments': instance.eventsAttachments,
    };
