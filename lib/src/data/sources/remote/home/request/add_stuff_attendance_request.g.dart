// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_stuff_attendance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStuffAttendanceRequest _$AddStuffAttendanceRequestFromJson(
        Map<String, dynamic> json) =>
    AddStuffAttendanceRequest(
      attendanceTypeName: json['attendanceTypeName'] as String,
      logitude: json['logitude'] as String,
      latitude: json['latitude'] as String,
    );

Map<String, dynamic> _$AddStuffAttendanceRequestToJson(
        AddStuffAttendanceRequest instance) =>
    <String, dynamic>{
      'attendanceTypeName': instance.attendanceTypeName,
      'logitude': instance.logitude,
      'latitude': instance.latitude,
    };
