import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_attendance_information.g.dart';

@JsonSerializable()
final class RemoteUserAttendanceInformation {
  final String? lastCheckIn;
  final String? lastCheckOut;
  final int? workingMinutes;

  const RemoteUserAttendanceInformation({
    this.lastCheckIn = "",
    this.lastCheckOut = "",
    this.workingMinutes = 0,
  });

  factory RemoteUserAttendanceInformation.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteUserAttendanceInformationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteUserAttendanceInformationToJson(this);
}

extension RemoteUserAttendanceInformationExtension
    on RemoteUserAttendanceInformation? {
  UserAttendanceInformation mapToDomain() => UserAttendanceInformation(
        lastCheckIn: this?.lastCheckIn ?? '-:-',
        lastCheckOut: this?.lastCheckOut ?? '-:-',
        workingMinutes: this?.workingMinutes ?? 0,
      );
}
