// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_attendance_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUserAttendanceInformation _$RemoteUserAttendanceInformationFromJson(
        Map<String, dynamic> json) =>
    RemoteUserAttendanceInformation(
      lastCheckIn: json['lastCheckIn'] as String? ?? "",
      lastCheckOut: json['lastCheckOut'] as String? ?? "",
      workingMinutes: json['workingMinutes'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteUserAttendanceInformationToJson(
        RemoteUserAttendanceInformation instance) =>
    <String, dynamic>{
      'lastCheckIn': instance.lastCheckIn,
      'lastCheckOut': instance.lastCheckOut,
      'workingMinutes': instance.workingMinutes,
    };
