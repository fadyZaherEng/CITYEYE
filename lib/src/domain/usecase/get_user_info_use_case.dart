import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserInfoUseCase {
  late final SharedPreferences sharedPreferences;

  GetUserInfoUseCase(this.sharedPreferences);

  UserInfo call() {
    return sharedPreferences.getString(SharedPreferenceKeys.userInfo) != null
        ? UserInfo.fromMap(
            jsonDecode(
                sharedPreferences.getString(SharedPreferenceKeys.userInfo) ??
                    ""),
          )
        : const UserInfo();
  }
}
