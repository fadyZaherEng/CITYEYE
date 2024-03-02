import 'package:city_eye/src/core/utils/convert_month_number_to_name.dart';

String formateDateToDays(String date) {
  String day = date.split("T")[0].split("-")[2].startsWith("0")
      ? date.split("T")[0].split("-")[2].substring(1)
      : date.split("T")[0].split("-")[2];
  return "$day \n ${convertNumberOfMonthToName(date.split("T")[0].split("-")[1])}";
}
