import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetDeviceUserInfoUseCase {
  late final SharedPreferences sharedPreferences;

  GetDeviceUserInfoUseCase(this.sharedPreferences);

  UserDeviceInfo call() {
    return sharedPreferences.getString(SharedPreferenceKeys.deviceInfo) != null
        ? UserDeviceInfo.fromMap(
            jsonDecode(
                sharedPreferences.getString(SharedPreferenceKeys.deviceInfo) ??
                    ""),
          )
        : const UserDeviceInfo();
  }
}
