import 'dart:io';

import 'package:city_eye/src/core/utils/android_date_picker.dart';
import 'package:city_eye/src/core/utils/ios_date_picker.dart';
import 'package:flutter/cupertino.dart';

void showDashboardDatePicker({
  required BuildContext context,
  required bool isToDate,
  required DateTime selectedToDate,
  required DateTime selectedFromDate,
  required void Function(DateTime? dateTime) onSelectDate,
  required void Function() onCancel,
  required void Function() onDone,
}) {
  if (Platform.isAndroid) {
    androidDatePicker(
      context: context,
      selectedDate: isToDate ? selectedToDate : selectedFromDate,
      onSelectDate: onSelectDate,
    );
  } else if (Platform.isIOS) {
    iosDatePicker(
      context: context,
      selectedDate: isToDate ? selectedToDate : selectedFromDate,
      textEditingController: TextEditingController(),
      onChange: onSelectDate,
      onCancel: onCancel,
      onDone: onDone,
    );
  }
}
