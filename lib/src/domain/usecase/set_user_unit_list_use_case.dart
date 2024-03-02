import 'dart:convert';

import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SaveUnitListUseCase {
  final SharedPreferences sharedPreferences;

  SaveUnitListUseCase(this.sharedPreferences);

  Future<bool> call(UnitLists unitLists) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.unitList, jsonEncode(unitLists.toMap()));
  }
}
