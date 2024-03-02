import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveFirebaseNotificationTokenUseCase {
  final SharedPreferences sharedPreferenceManager;

  SaveFirebaseNotificationTokenUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String firebaseNotificationToken}) async {
    return await sharedPreferenceManager.setString(
        SharedPreferenceKeys.notificationToken, firebaseNotificationToken);
  }
}
