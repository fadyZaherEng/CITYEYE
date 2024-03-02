import 'dart:convert';
import 'dart:developer';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoveUserInformationUseCase {
  late final SharedPreferences sharedPreferences;

  RemoveUserInformationUseCase(this.sharedPreferences);

  Future<bool> call() async {
    if (sharedPreferences.getString(SharedPreferenceKeys.user) != null) {
      return sharedPreferences.remove(SharedPreferenceKeys.user);
    } else {
      return false;
    }
  }
}
