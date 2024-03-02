import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/permission_service_handler.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_language_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/more/language.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/usecase/set_notification_use_case.dart';
import 'package:city_eye/src/presentation/blocs/more/more_bloc.dart';
import 'package:city_eye/src/presentation/screens/more/widgets/more_header_widget.dart';
import 'package:city_eye/src/presentation/screens/more/widgets/more_item_divider.dart';
import 'package:city_eye/src/presentation/screens/more/widgets/more_item_widget.dart';
import 'package:city_eye/src/presentation/widgets/restart_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class MoreScreen extends BaseStatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MoreScreenState();
}

class _MoreScreenState extends BaseState<MoreScreen> {
  MoreBloc get _bloc => BlocProvider.of<MoreBloc>(context);

  List<Language> languages = [];
  Language selectedLanguage = const Language(
    id: -1,
    name: "",
    image: "",
    code: "",
  );

  @override
  void initState() {
    super.initState();
    _bloc.add(GetUserInformationEvent());
    _bloc.add(GetLanguageEvent());
    _bloc.add(GetIsActiveNotificationEvent());
  }

  User _user = const User();

  bool isActiveNotification = false;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is NavigateToNotificationScreenState) {
          Navigator.pushNamed(context, Routes.notifications);
        } else if (state is NavigateToChangePasswordScreenState) {
          Navigator.pushNamed(context, Routes.changePassword);
        } else if (state is GetLanguagesSuccessState) {
          languages = state.languages;
          _showLanguagesBottomSheet(
            context: context,
            languages: state.languages,
          );
        } else if (state is GetLanguagesErrorState) {
          showMessageDialogWidget(
            context: context,
            text: state.message,
            icon: ImagePaths.error,
            buttonText: S.of(context).ok,
            onTap: () {
              _navigateBackEvent();
            },
          );
        } else if (state is NavigateBackState) {
          Navigator.of(context).pop();
        } else if (state is SetLanguageState) {
          _bloc.add(SetRestartAppEvent());
        } else if (state is SetRestartAppState) {
          RestartWidget.restartApp(context);
        } else if (state is GetLanguageState) {
          selectedLanguage = selectedLanguage.copyWith(
            code: state.languageCode,
          );
        } else if (state is ShowLogoutDialogState) {
          showActionDialogWidget(
            context: context,
            icon: ImagePaths.icWarningNew,
            secondaryAction: _logout,
            secondaryText: S.of(context).yes,
            primaryAction: () => Navigator.of(context).pop(),
            primaryText: S.of(context).no,
            text: S.of(context).areYouSureYouWantToLogOut,
          );
        } else if (state is SuccessLogoutState) {
          _navigateToSignIn();
        } else if (state is NavigateToSignInState) {
          _bloc.add(RestartAppWhenLogoutEvent());
        } else if (state is RestartAppWhenLogoutState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.splash,
            (route) => false,
          );
        } else if (state is GetUserInformationState) {
          _user = state.user;
        } else if (state is GetIsActiveNotificationState) {
          isActiveNotification = state.isActive;
        } else if (state is SwitchNotificationSuccessState) {
          isActiveNotification = state.value;
        } else if (state is SwitchNotificationErrorState) {
          showMessageDialogWidget(
            context: context,
            text: state.massage,
            icon: ImagePaths.error,
            buttonText: S.of(context).ok,
            onTap: () {
              _bloc.add(NavigateBackEvent());
            },
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              MoreHeaderWidget(
                user: _user,
                onTapSwitchAction: () {},
                onTapSelectCompound: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              MoreItemWidget(
                title: S.of(context).language,
                imagePath: ImagePaths.language,
                onTap: () => _openLanguagesBottomSheet(),
              ),
              const MoreItemDivider(),
              MoreItemWidget(
                isSwitchIcon: true,
                valueOfSwitch: isActiveNotification,
                onToggleSwitch: (value) async {
                  await _setupNotificationPermission(value: value);
                },
                title: S.of(context).notifications,
                imagePath: ImagePaths.secondNotification,
                onTap: () => _navigateToNotificationScreen(),
              ),
              const MoreItemDivider(),
              MoreItemWidget(
                title: S.of(context).changePassword,
                imagePath: ImagePaths.icLock,
                onTap: () => _bloc.add(NavigateToChangePasswordScreenEvent()),
              ),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: _showLogoutDialog,
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[200]!,
                  ),
                ),
                child: Text(
                  S.of(context).logout,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorSchemes.redError,
                      ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _logout() => _bloc.add(LogoutEvent());

  void _showLogoutDialog() => _bloc.add(ShowLogoutDialogEvent());

  void _navigateToSignIn() => _bloc.add(NavigateToSignInEvent());

  void _showLanguagesBottomSheet({
    required BuildContext context,
    required List<Language> languages,
  }) =>
      showLanguageBottomSheet(
        context: context,
        languages: languages,
        selectedLanguage: selectedLanguage,
        onLanguageSelected: (language) {
          _navigateBackEvent();
          if (language.code == selectedLanguage.code) return;
          selectedLanguage = language;
          _bloc.add(
            SetLanguageEvent(
              languageCode: selectedLanguage.code,
            ),
          );
          //_navigateBackEvent();
        },
        height: 400,
      );

  void _navigateToNotificationScreen() =>
      _bloc.add(NavigateToNotificationScreenEvent());

  void _navigateBackEvent() {
    _bloc.add(NavigateBackEvent());
  }

  void _openLanguagesBottomSheet() {
    _bloc.add(GetRemoteLanguagesEvent());
  }

  Future _setupNotificationPermission({required bool value}) async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await SetNotificationStatusUseCase(injector())(value);
      _bloc.add(SetIsActiveNotificationEvent(isActive: value));
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      await SetNotificationStatusUseCase(injector())(value);
      _bloc.add(SetIsActiveNotificationEvent(isActive: value));
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      await SetNotificationStatusUseCase(injector())(false);
      _messageActionDialog(
        text: S.current.youShouldAllowNotificationsPermissionToContinue,
        primaryText: S.current.settings,
        secondaryText: S.current.cancel,
        primaryAction: () {
          Navigator.pop(context);
          openAppSettings().then((value) async {
            if (await PermissionServiceHandler()
                .handleServicePermission(setting: Permission.notification)) {
              _bloc.add(SetIsActiveNotificationEvent(isActive: value));
            }
          });
        },
      );
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      await SetNotificationStatusUseCase(injector())(false);
    }
  }

  void _messageActionDialog({
    required String text,
    required Function() primaryAction,
    String? primaryText,
    String? secondaryText,
  }) {
    showActionDialogWidget(
        context: context,
        text: text,
        icon: ImagePaths.warning,
        primaryText: primaryText ?? S.of(context).yes,
        secondaryText: secondaryText ?? S.of(context).no,
        primaryAction: () {
          primaryAction();
        },
        secondaryAction: () {
          Navigator.pop(context);
        });
  }
}
