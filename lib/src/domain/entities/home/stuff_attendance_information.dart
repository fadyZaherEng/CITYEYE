import 'package:equatable/equatable.dart';

final class UserAttendanceInformation extends Equatable {
  final String lastCheckIn;
  final String lastCheckOut;
  final int workingMinutes;

  const UserAttendanceInformation({
    this.lastCheckIn = "",
    this.lastCheckOut = "",
    this.workingMinutes = -1,
  });

  UserAttendanceInformation copyWith({
    String? lastCheckIn,
    String? lastCheckOut,
    int? workingMinutes,
  }) {
    return UserAttendanceInformation(
      lastCheckIn: lastCheckIn ?? this.lastCheckIn,
      lastCheckOut: lastCheckOut ?? this.lastCheckOut,
      workingMinutes: workingMinutes ?? this.workingMinutes,
    );
  }

  @override
  List<Object> get props => [
        lastCheckIn,
        lastCheckOut,
        workingMinutes,
      ];
}
