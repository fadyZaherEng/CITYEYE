// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/notification_services.dart';
import 'package:city_eye/src/core/utils/permission_service_handler.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/entities/push_notification/firebase_notification_data.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/presentation/blocs/main/main_bloc.dart';
import 'package:city_eye/src/presentation/screens/home/home_screen.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_enum.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_extension.dart';
import 'package:city_eye/src/presentation/screens/main/widgets/bottom_navigation_bar_widget.dart';
import 'package:city_eye/src/presentation/screens/more/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends BaseStatefulWidget {
  const MainScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen> {
  MainBloc get _bloc => BlocProvider.of<MainBloc>(context);

  User _user = const User();

  @override
  void initState() {
    _bloc.add(GetCurrentUserEvent());
    _notificationListener();
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) async {
        if (state is SuccessFetchCurrentUserState) {
          _user = state.user;
        } else if (state is SuccessNavigateBetweenScreensState) {
          currentIndex = state.currentPosition;
        } else if (state is NavigateToScanQrCodeScreenState) {
          if (await PermissionServiceHandler()
              .handleServicePermission(setting: Permission.camera)) {
            Navigator.of(context).pushNamed(Routes.qrScan).then((value) => {
                  _getCurrentScreen(currentIndex),
                });
          } else {
            showActionDialogWidget(
              context: context,
              text: S.of(context).youShouldHaveCameraPermission,
              icon: ImagePaths.cameraTwo,
              primaryText: S.of(context).ok,
              secondaryText: S.of(context).cancel,
              primaryAction: () async {
                Navigator.of(context).pop();
                openAppSettings().then((value) {
                  if (value) {
                    Navigator.of(context).pushNamed(Routes.qrScan).then((value) => {
                          _getCurrentScreen(currentIndex),
                        });
                  }
                });
              },
              secondaryAction: () {
                Navigator.of(context).pop();
              },
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset:
              _user.userType.code == CityEyeUserType.technical.toUserType
                  ? null
                  : false,
          body: _getCurrentScreen(currentIndex),
          floatingActionButtonLocation:
              _user.userType.code == CityEyeUserType.security.toUserType
                  ? FloatingActionButtonLocation.centerDocked
                  : null,
          floatingActionButton: _buildFloatingActionButton(onTap: () {
            _bloc.add(NavigateToScanQrCodeScreenEvent());
          }),
          bottomNavigationBar: BottomNavigationBarWidget(
            userTypeCode: _user.userType.code,
            onTap: (index) {
              _bloc.add(
                NavigateBetweenScreensEvent(
                  position: index,
                ),
              );
            },
            currentIndex: currentIndex,
          ),
        );
      },
    );
  }

  Widget _getCurrentScreen(int position) {
    if (position == 0) {
      return const HomeScreen();
    } else if (position == 1) {
      return const MoreScreen();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget? _buildFloatingActionButton({
    required Function() onTap,
  }) {
    return _user.userType.code == CityEyeUserType.security.toUserType
        ? FloatingActionButton(
            onPressed: onTap,
            elevation: 0.0,
            backgroundColor: ColorSchemes.primary,
            child: SvgPicture.asset(
              ImagePaths.scanner,
              fit: BoxFit.scaleDown,
            ),
          )
        : null;
  }

  void _notificationListener() {
    NotificationService.onNotificationClick.stream.listen((event) {
      _onNotificationClick(event);
    });
  }

  void _onNotificationClick(String? notificationData) {
    FirebaseNotificationData firebaseNotificationData =
        mapNotification(notificationData);

    if (firebaseNotificationData.code == "general") {
      _showMassageDialogWidget(firebaseNotificationData.message);
    } else if (firebaseNotificationData.code == "qrDetails" ||
        firebaseNotificationData.code == "current_qrHistory"||
        firebaseNotificationData.code == "previous_qrHistory" &&
        _user.userType.id == 4) {
      _navigateToQrDetailsScreen(firebaseNotificationData.id);
    } else if (firebaseNotificationData.code == "support_comments" &&
        _user.userType.id == 5) {
      Navigator.pushNamed(context, Routes.comments,
          arguments: firebaseNotificationData.id);
    } else if ((firebaseNotificationData.code == "supportDetails" ||
        firebaseNotificationData.code == "open_support" ||
        firebaseNotificationData.code == "all_support" ||
        firebaseNotificationData.code == "support_completed" ||
            firebaseNotificationData.code.toLowerCase().contains("support") ||
            firebaseNotificationData.code.toLowerCase().contains("job")) &&
        _user.userType.id == 5) {
      _navigateToJobDetailsScreen(firebaseNotificationData.id);
    } else if (firebaseNotificationData.code == "notifications") {
      _navigateToNotificationsScreen(firebaseNotificationData.id);
    } else if (firebaseNotificationData.code == "notificationsDetails") {
      _navigateToNotificationsDetailsScreen(firebaseNotificationData.id);
    } else if (firebaseNotificationData.code == "TechUnitsQr") {
      _bloc.add(
        NavigateBetweenScreensEvent(
          position: 0,
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    NotificationService.onNotificationClick.add("");
  }

  FirebaseNotificationData mapNotification(String? notificationData) {
    Map<String, dynamic> mapDate = json.decode(notificationData!);
    FirebaseNotificationData model = FirebaseNotificationData.fromJson(mapDate);

    return model;
  }

  Future<void> _navigateToQrDetailsScreen(int id) async {
    await Navigator.of(context).pushNamed(Routes.qrDetails, arguments: {
      "qrCodeDetailsIdOrPinCode": id,
      'isComeFromQrScanner': false,
    });
  }

  void _navigateToJobDetailsScreen(int id) {
    Navigator.of(context).pushNamed(Routes.jobDetails, arguments: id);
  }

  void _navigateToNotificationsScreen(int id) {
    Navigator.of(context).pushNamed(Routes.notifications);
  }

  void _navigateToNotificationsDetailsScreen(int id) {
    Navigator.pushNamed(
      context,
      Routes.notificationDetails,
      arguments: {
        "isPushedNotification": true,
        "details": const NotificationItem(),
        "id": id
      },
    );
  }

  void _showMassageDialogWidget(String text) {
    showMessageDialogWidget(
      context: context,
      text: text,
      icon: ImagePaths.info,
      buttonText: S.of(context).ok,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
