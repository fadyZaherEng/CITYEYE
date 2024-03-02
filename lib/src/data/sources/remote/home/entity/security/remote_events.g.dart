// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEvents _$RemoteEventsFromJson(Map<String, dynamic> json) => RemoteEvents(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      isPaid: json['isPaid'] as bool?,
      maxCountJoin: json['maxCountJoin'] as int?,
      memberCount: json['memberCount'] as int?,
      memberPrice: json['memberPrice'] as int?,
      locationAddress: json['locationAddress'] as String?,
      locationLatitude: json['locationLatitude'] as String?,
      locationLongitude: json['locationLongitude'] as String?,
      transactionId: json['transactionId'] as int?,
      calendarRef: json['calendarRef'] as String?,
      eventsOptions: (json['eventsOptions'] as List<dynamic>?)
          ?.map((e) => RemoteEventsOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventsRules: (json['eventsRules'] as List<dynamic>?)
          ?.map((e) => RemoteEventsRules.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventsAttachments: json['eventsAttachments'] as List<dynamic>?,
    );

Map<String, dynamic> _$RemoteEventsToJson(RemoteEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isPaid': instance.isPaid,
      'maxCountJoin': instance.maxCountJoin,
      'memberCount': instance.memberCount,
      'memberPrice': instance.memberPrice,
      'locationAddress': instance.locationAddress,
      'locationLatitude': instance.locationLatitude,
      'locationLongitude': instance.locationLongitude,
      'transactionId': instance.transactionId,
      'calendarRef': instance.calendarRef,
      'eventsOptions': instance.eventsOptions,
      'eventsRules': instance.eventsRules,
      'eventsAttachments': instance.eventsAttachments,
    };
