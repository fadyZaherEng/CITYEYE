import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetNotificationStatusUseCase {
  final SharedPreferences sharedPreferences;

  SetNotificationStatusUseCase(this.sharedPreferences);

  Future<bool> call(bool value) async {
    return await sharedPreferences.setBool(
        SharedPreferenceKeys.notificationStatus, value);
  }
}
