// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names
import 'dart:io';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/utils/make_call.dart';
import 'package:city_eye/src/core/utils/permission_service_handler.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/presentation/screens/delegation_details/widgets/delegation_details_card_widget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DelegationDetailsScreen extends BaseStatefulWidget {
  final DelegationScanned delegationScanned;
  final UserUnitInfo userUnitInfo;
  final bool isValid;

  const DelegationDetailsScreen({
    super.key,
    required this.delegationScanned,
    required this.isValid,
    required this.userUnitInfo,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends BaseState<DelegationDetailsScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: ColorSchemes.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40.0),
                  topEnd: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorSchemes.notificationShadow,
                    spreadRadius: 0.0,
                    blurRadius: 32.0,
                    offset: Offset(0, 4),
                  )
                ],
              ),
            ),
            DelegationDetailsCardWidget(
              delegationScanned: widget.delegationScanned,
              userUnitInfo: widget.userUnitInfo,
              isValid: widget.isValid,
              onPressedCall: () {
                makingPhoneCall(widget.delegationScanned.authMobile.toString());
              },
              onDelegationButtonPressed: () {
                _requestStoragePermission(
                    widget.delegationScanned.documentDelegation);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestStoragePermission(String file) async {
    Permission permission = Permission.storage;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final androidInfo = await deviceInfoPlugin.androidInfo;
      permission = androidInfo.version.sdkInt >= 33
          ? Permission.mediaLibrary
          : Permission.storage;
    } else {
      permission = Permission.storage;
    }
    PermissionStatus status = await permission.request();
    if (status.isGranted) {
      _onDownloadQrClicked(file);
    } else {
      bool storagePermission = await PermissionServiceHandler()
          .handleServicePermission(setting: permission);
      if (storagePermission) {
        _onDownloadQrClicked(file);
      } else {
        showActionDialogWidget(
          icon: "",
          primaryAction: () async {
            Navigator.pop(context);
            openAppSettings().then((value) {
              _requestStoragePermission(file);
            });
          },
          secondaryAction: () {
            Navigator.pop(context);
          },
          primaryText: !context.mounted ? "" : S.of(context).ok,
          secondaryText: !context.mounted ? "" : S.of(context).cancel,
          text: !context.mounted
              ? ""
              : S.of(context).youShouldHaveStoragePermission,
          context: context,
        );
      }
    }
  }

  void _onDownloadQrClicked(String file) async {
    bool downloadSuccess = true;
    Directory? dir;
    if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await DownloadsPathProvider.downloadsDirectory;
    }
    if (dir != null) {
      try {
        await Dio().download(
          file,
          "${dir.path}/${file.split("/").last ?? ""}",
          onReceiveProgress: (received, total) {},
        );
      } on DioError catch (e) {
        downloadSuccess = false;
        showToastMessage(S.current.delegationDownloadFailed);
      }
      if (downloadSuccess) {
        showToastMessage(S.current.delegationDownloadSuccessful);
      } else {
        showToastMessage(S.current.delegationDownloadFailed);
      }
    }
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
