import 'package:json_annotation/json_annotation.dart';

part 'add_stuff_attendance_request.g.dart';

@JsonSerializable()
final class AddStuffAttendanceRequest {
  final String attendanceTypeName;
  final String logitude;
  final String latitude;

  const AddStuffAttendanceRequest(
      {required this.attendanceTypeName,
      required this.logitude,
      required this.latitude});

  factory AddStuffAttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddStuffAttendanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddStuffAttendanceRequestToJson(this);
}
