import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetDeviceUserInformationUseCase {
  final SharedPreferences sharedPreferences;

  SetDeviceUserInformationUseCase(this.sharedPreferences);

  Future<bool> call(UserDeviceInfo userDeviceInfo) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.deviceInfo, jsonEncode(userDeviceInfo.toMap()));
  }
}
