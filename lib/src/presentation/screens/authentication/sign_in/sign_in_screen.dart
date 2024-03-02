import 'dart:async';
import 'dart:io';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_action_dialog_widget.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:city_eye/src/presentation/screens/authentication/sign_in/bottom_sheet_content_widget.dart';
import 'package:city_eye/src/presentation/screens/authentication/sign_in/sign_in_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends BaseStatefulWidget {
  const SignInScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SignInScreenState();
}

class _SignInScreenState extends BaseState<SignInScreen> {
  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isCheckRememberMe = false;
  String? _mobileNumberErrorMessage;
  String? _passwordErrorMessage;
  bool isDebouncing = false;
  double _heightOfBottomSheet = 0;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetRememberMeEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is SignInSuccessState) {
          if (_isCheckRememberMe) {
            _bloc.add(SetRememberMeEvent(rememberMeValue: _isCheckRememberMe));
          }
          _showLoginBottomSheet(state.login);
        } else if (state is SignInErrorState) {
          _showMessageDialog(
            message: state.errorMessage,
            icon: ImagePaths.error,
            onTap: () {
              Navigator.pop(context);
            },
          );
        } else if (state is ChangeRememberMeValueState) {
          _isCheckRememberMe = state.rememberMeValue;
        } else if (state is NavigateToForgotPasswordScreenState) {
          if (_isCheckRememberMe) {
            _bloc.add(ChangeRememberMeValueEvent(
              rememberMeValue: false,
            ));
          }
          _navigateToForgotPasswordScreen();
        } else if (state is MobileNumberEmptyFormatState) {
          _mobileNumberErrorMessage = state.mobileNumberValidatorMessage;
        } else if (state is MobileNumberFormatValidState) {
          _mobileNumberErrorMessage = null;
        } else if (state is PasswordEmptyFormatState) {
          _passwordErrorMessage = state.passwordValidatorMessage;
        } else if (state is PasswordFormatValidState) {
          _passwordErrorMessage = null;
        } else if (state is GetRememberMeState) {
          _isCheckRememberMe = state.rememberMe;
        } else if (state is UserExitFromAppState) {
          _onWillPop();
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _bloc.add(UserExitFromAppEvent());

            return Future.value(true);
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SignInContentWidget(
                mobileNumberController: _mobileNumberController,
                passwordController: _passwordController,
                isCheckRememberMe: _isCheckRememberMe,
                phoneNumberErrorMessage: _mobileNumberErrorMessage,
                passwordErrorMessage: _passwordErrorMessage,
                onCreateAccountPressed: () {},
                validationMobileNumberAction: (String number, String code) {
                  _bloc.add(ValidateMobileNumberEvent(
                    mobileNumber: number,
                    regionCode: code,
                  ));
                },
                validationPasswordAction: (String value) {
                  _bloc.add(ValidatePasswordEvent(
                    password: value,
                  ));
                },
                rememberMeAction: (bool value) {
                  _bloc.add(ChangeRememberMeValueEvent(
                    rememberMeValue: value,
                  ));
                },
                forgetPasswordAction: () {
                  _bloc.add(NavigateToForgotPasswordScreenEvent());
                },
                signInAction: () {
                  _signInEvent();
                },
                onCloseAction: () {
                  _bloc.add(
                    ChangeRememberMeValueEvent(
                      rememberMeValue: false,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _signInEvent() {
    if (!isDebouncing) {
      setState(() {
        isDebouncing = true;
      });

      _bloc.add(
        SignInEvent(
          mobileNumber: _mobileNumberController.text,
          password: _passwordController.text,
        ),
      );

      Timer(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            isDebouncing = false;
          });
        }
      });
    }
  }

  void _navigateToMainScreen() {
    Navigator.pushReplacementNamed(
      context,
      Routes.mainCityEyeScreen,
    );
    hideLoading();
  }

  void _showMessageDialog({
    required String message,
    required String icon,
    required Function() onTap,
  }) {
    showMessageDialogWidget(
      context: context,
      text: message,
      icon: icon,
      buttonText: S.of(context).ok,
      onTap: () {
        onTap();
      },
    );
  }

  void _onWillPop() {
    showActionDialogWidget(
        context: context,
        text: S.of(context).areYouSureYouWantExitCityEye,
        icon: ImagePaths.warning,
        primaryText: S.of(context).no,
        secondaryText: S.of(context).yes,
        primaryAction: () {
          Navigator.pop(context);
        },
        secondaryAction: () async {
          exit(0);
        });
  }

  void _navigateToForgotPasswordScreen() {
    Navigator.pushNamed(
      context,
      Routes.forgetPassword,
    );
  }

  void _showLoginBottomSheet(Login user) {
    _heightOfBottomSheet = 90 + (user.unitLists.length * 80);
    showBottomSheetWidget(
      context: context,
      isDismissible: false,
      onClose: () => Navigator.pop(context),
      isPadding: false,
      height: _heightOfBottomSheet,
      titleLabel: S.of(context).selectCompound,
      content: BottomSheetContentWidget(
        unitLists: user.unitLists,
        userInfo: user.userInfo,
        onTap: () {
          showLoading();
          _navigateToMainScreen();
        },
      ),
    );
  }
}
