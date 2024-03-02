import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetUserInformationUseCase {
  final SharedPreferences sharedPreferences;

  SetUserInformationUseCase(this.sharedPreferences);

  Future<bool> call(UserInfo userInfo) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.userInfo, jsonEncode(userInfo.toMap()));
  }
}
