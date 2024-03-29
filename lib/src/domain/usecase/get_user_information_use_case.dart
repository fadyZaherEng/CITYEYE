import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserInformationUseCase {
  late final SharedPreferences sharedPreferences;

  GetUserInformationUseCase(this.sharedPreferences);

  User call() {
    return sharedPreferences.getString(SharedPreferenceKeys.user) != null
        ? User.fromMap(
            jsonDecode(
                sharedPreferences.getString(SharedPreferenceKeys.user) ?? ""),
          )
        : const User();
  }
}
