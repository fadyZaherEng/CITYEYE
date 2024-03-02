import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetFirebaseNotificationTokenUseCase {
  final SharedPreferences sharedPreferenceManager;

  GetFirebaseNotificationTokenUseCase(this.sharedPreferenceManager);

  String call()  {
    return  sharedPreferenceManager.getString(
        SharedPreferenceKeys.notificationToken) ?? "";
  }
}
