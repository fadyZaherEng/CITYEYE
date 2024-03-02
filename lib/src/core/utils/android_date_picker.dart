import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

void androidDatePicker({
  required BuildContext context,
  required DateTime? selectedDate,
  required Function(DateTime?) onSelectDate,
}) async {
  var chosenDateTime = await showDatePicker(
    context: context,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: ColorSchemes.primary,
          ),
        ),
        child: child!,
      );
    },
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ),
    lastDate: DateTime(3000),
  );

  if (chosenDateTime != null) {
    onSelectDate(chosenDateTime);
  } else {
    onSelectDate(null);
  }
}
