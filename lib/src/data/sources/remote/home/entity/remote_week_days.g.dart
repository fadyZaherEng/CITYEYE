// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_week_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteWeekDays _$RemoteWeekDaysFromJson(Map<String, dynamic> json) =>
    RemoteWeekDays(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteWeekDaysToJson(RemoteWeekDays instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
