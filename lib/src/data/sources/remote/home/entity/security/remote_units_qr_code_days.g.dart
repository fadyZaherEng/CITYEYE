// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_units_qr_code_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUnitsQrCodeDays _$RemoteUnitsQrCodeDaysFromJson(
        Map<String, dynamic> json) =>
    RemoteUnitsQrCodeDays(
      id: json['id'] as int? ?? 0,
      unitsQRCodeId: json['unitsQRCodeId'] as int? ?? 0,
      weekDays: json['weekDays'] == null
          ? const RemoteWeekDays()
          : RemoteWeekDays.fromJson(json['weekDays'] as Map<String, dynamic>),
      dayTime: json['dayTime'] == null
          ? const RemoteDayTime()
          : RemoteDayTime.fromJson(json['dayTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteUnitsQrCodeDaysToJson(
        RemoteUnitsQrCodeDays instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitsQRCodeId': instance.unitsQRCodeId,
      'weekDays': instance.weekDays,
      'dayTime': instance.dayTime,
    };
