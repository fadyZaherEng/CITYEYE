import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNotificationStatusUseCase {
  final SharedPreferences sharedPreferences;

  GetNotificationStatusUseCase(this.sharedPreferences);

  bool call() {
    return sharedPreferences.getBool(SharedPreferenceKeys.notificationStatus) ??
        false;
  }
}
