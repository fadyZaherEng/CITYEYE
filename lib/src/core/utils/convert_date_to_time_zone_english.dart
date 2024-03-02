import 'package:intl/intl.dart';

String convertDateToTimeZoneEnglish(String date) =>
    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", 'en_US')
        .format(DateTime.parse(date));
