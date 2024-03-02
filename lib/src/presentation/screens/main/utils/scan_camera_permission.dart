import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

sealed class ScanCameraPermission {
  static Future<PermissionResultStatus> checkPermission(
      {required BuildContext context}) async {
    if (Platform.isAndroid) {
      if (await _handleAndroidVersionPermission()) {
        return await _askPermission();
      }
    } else if(Platform.isIOS) {
      return await _askPermission();
    }
    return const PermissionResultStatus();
  }

  static Future<PermissionResultStatus> _askPermission() async {
    await Permission.camera.request();
    if (await Permission.camera.isGranted) {
      return const PermissionResultStatus(isGranted: true);
    } else if (await Permission.camera.isPermanentlyDenied) {
      return const PermissionResultStatus(permanentlyDenied: true);
    }
    return const PermissionResultStatus();
  }

  static Future<bool> _handleAndroidVersionPermission() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;
    if (sdkInt <= 33 || sdkInt > 33) {
      return true;
    }
    return false;
  }
}

final class PermissionResultStatus {
  final bool isGranted;
  final bool permanentlyDenied;

  const PermissionResultStatus({
    this.isGranted = false,
    this.permanentlyDenied = false,
  });
}
