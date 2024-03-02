import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../generated/l10n.dart';
import 'check_statistic_item.dart';

class CheckingStatisticsWidget extends StatelessWidget {
  final UserAttendanceInformation stuffAttendanceInformation;

  const CheckingStatisticsWidget({
    super.key,
    required this.stuffAttendanceInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckStatisticItem(
          pathIcon: ImagePaths.secondCheckIn,
          titleOfChecking: S.of(context).checkIn,
          value: stuffAttendanceInformation.lastCheckIn.isNotEmpty ? stuffAttendanceInformation.lastCheckIn : '-:-',
        ),
        CheckStatisticItem(
          pathIcon: ImagePaths.secondCheckOut,
          titleOfChecking: S.of(context).checkOut,
          value: stuffAttendanceInformation.lastCheckOut.isNotEmpty ? stuffAttendanceInformation.lastCheckOut : '-:-',
        ),
        CheckStatisticItem(
          pathIcon: ImagePaths.done,
          titleOfChecking: S.of(context).workHour,
          value: _formatMinutesToHoursAndMinutes(
            minutes: stuffAttendanceInformation.workingMinutes,
          ),
        ),
      ],
    );
  }

  String _formatMinutesToHoursAndMinutes({required int minutes}) {
    Duration duration = Duration(minutes: minutes);
    String formattedTime =
        DateFormat.Hm().format(DateTime(0, 1, 1, 0, minutes));
    return formattedTime;
  }
}
