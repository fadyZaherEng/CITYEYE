import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SetRestartAppUseCase{
  final SharedPreferences _sharedPreferences;

  SetRestartAppUseCase(this._sharedPreferences);
  Future<bool> call(bool value) async {
    return await _sharedPreferences.setBool(SharedPreferenceKeys.isRestart, value);
  }
}