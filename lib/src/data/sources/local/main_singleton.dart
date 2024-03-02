import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:flutter/material.dart';

final class MainSingleton {
  MainSingleton._();

  static final MainSingleton _instance = MainSingleton._();

  factory MainSingleton() => _instance;

  String pinCode = "";
  bool isScan = false;
  User user = const User();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}