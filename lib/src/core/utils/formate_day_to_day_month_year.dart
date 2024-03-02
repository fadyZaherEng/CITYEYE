import 'package:intl/intl.dart';

String formaterDateToDayMonthYear(String date) =>
    DateFormat('d/M/y').format(DateTime.parse(date)).toString();
