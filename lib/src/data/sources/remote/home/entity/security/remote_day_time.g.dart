// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_day_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDayTime _$RemoteDayTimeFromJson(Map<String, dynamic> json) =>
    RemoteDayTime(
      id: json['id'] as int? ?? 0,
      fromTime: json['fromTime'] as String? ?? "",
      toTime: json['toTime'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteDayTimeToJson(RemoteDayTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromTime': instance.fromTime,
      'toTime': instance.toTime,
    };
