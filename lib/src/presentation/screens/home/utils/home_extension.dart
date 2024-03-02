import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_enum.dart';
import 'package:flutter/material.dart';

extension ConverterStatusColorToRealColor on StatusColor {
  Color get toColor {
    switch (this) {
      case StatusColor.success:
        return ColorSchemes.green;
      case StatusColor.notSuccess:
        return ColorSchemes.redError;
    }
  }
}

extension CheckingStatusToRealStatus on CheckingStatus {
  String get toStatus {
    switch (this) {
      case CheckingStatus.checkIn:
        return 'in';
      case CheckingStatus.checkOut:
        return 'out';
    }
  }
}

extension UserTypeToRealUserType on CityEyeUserType {
  String get toUserType {
    switch (this) {
      case CityEyeUserType.security:
        return '4';
      case CityEyeUserType.technical:
        return '5';
      case CityEyeUserType.manager:
        return '6';
    }
  }
}
