import 'dart:async';
import 'dart:developer';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/presentation/blocs/forget_password/forget_password_bloc.dart';
import 'package:city_eye/src/presentation/screens/authentication/forget_password/widget/forget_password_content_widget.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends BaseStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends BaseState<ForgetPasswordScreen> {
  ForgetPasswordBloc get _bloc => BlocProvider.of<ForgetPasswordBloc>(context);
  final TextEditingController _emailAddressController = TextEditingController();
  String? _emailErrorMessage;
  bool isDebouncing = false;

  @override
  Widget baseBuild(BuildContext context) {
    log("base Build For Forgot Password");
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          showLoading();
        } else if (state is ForgetPasswordHideLoadingState) {
          hideLoading();
        } else if (state is ForgetPasswordSuccessState) {
          _onForgetPasswordSuccessState();
        } else if (state is ForgetPasswordErrorState) {
          _onForgetPasswordErrorState(
            errorMessage: state.errorMessage,
          );
        } else if (state is EmailEmptyState) {
          _emailErrorMessage = state.emailValidatorMessage;
        } else if (state is EmailValidState) {
          _emailErrorMessage = null;
        } else if (state is EmailNotValidState) {
          _emailErrorMessage = state.emailValidatorMessage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S
                  .of(context)
                  .forgotPassword,
              isHaveBackButton: true, onBackButtonPressed: () {
                Navigator.pop(
                  context,
                );
              }),
          body: ForgetPasswordContentWidget(
            emailAddressController: _emailAddressController,
            emailErrorMessage: _emailErrorMessage,
            validateEmailAction: (String value) {
              _bloc.add(ValidateEmailEvent(
                email: value.trim(),
              ));
            },
            resetPasswordAction: () {
              _resetPasswordEvent();
            },
          ),
        );
      },
    );
  }

  void _resetPasswordEvent() {
    if (!isDebouncing) {
      setState(() {
        isDebouncing = true;
      });

      _bloc.add(ResetPasswordEvent(
        email: _emailAddressController.text.trim(),
      ));

      Timer(Duration(seconds: 1), () {
        setState(() {
          isDebouncing = false;
        });
      });
    }
  }

  void _onForgetPasswordSuccessState() {
    _emailErrorMessage = null;
    _dialogMessage(
        message: S
            .of(context)
            .checkYourEmail,
        icon: ImagePaths.success,
        action: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }

  void _onForgetPasswordErrorState({
    required String errorMessage,
  }) {
    _dialogMessage(
      message: errorMessage,
      icon: ImagePaths.error,
      action: () => Navigator.pop(context),
    );
  }

  void _dialogMessage({required String message, required String icon,required Function() action,}) {
    showMessageDialogWidget(
      context: context,
      text: message,
      icon: icon,
      buttonText: S
          .of(context)
          .ok,
      onTap: action,
    );
  }
}
