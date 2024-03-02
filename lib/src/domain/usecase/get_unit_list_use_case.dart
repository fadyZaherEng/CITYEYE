import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUnitListUseCase {
  final SharedPreferences sharedPreferences;

  GetUnitListUseCase(this.sharedPreferences);

  UnitLists call() {
    return sharedPreferences.getString(SharedPreferenceKeys.unitList) != null
        ? UnitLists.fromMap(jsonDecode(
            sharedPreferences.getString(SharedPreferenceKeys.unitList) ?? ""))
        : const UnitLists();
  }
}
