// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_submit_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSubmitEvent _$RemoteSubmitEventFromJson(Map<String, dynamic> json) =>
    RemoteSubmitEvent(
      countCurrentJoin: json['countCurrentJoin'] as int? ?? 0,
      transactionId: json['transactionId'] as int? ?? 0,
      extraFieldEvents: (json['extraFieldEvents'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteExtraFieldEvents.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteSubmitEventToJson(RemoteSubmitEvent instance) =>
    <String, dynamic>{
      'countCurrentJoin': instance.countCurrentJoin,
      'transactionId': instance.transactionId,
      'extraFieldEvents': instance.extraFieldEvents,
    };
