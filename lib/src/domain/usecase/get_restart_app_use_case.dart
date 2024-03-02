import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetRestartAppUseCase {
  final SharedPreferences sharedPreferences;

  const GetRestartAppUseCase(this.sharedPreferences);

  bool call() {
    return sharedPreferences.getBool(SharedPreferenceKeys.isRestart) ?? false;
  }
}
