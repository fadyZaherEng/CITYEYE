import 'dart:async';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/core/utils/validation/sign_in_validator.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/sign_in_request.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/domain/usecase/get_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_device_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_user_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/sign-in/sign_in_use_case.dart';
import 'package:city_eye/src/domain/usecase/sign_in_validation_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libphonenumber_plugin/libphonenumber_plugin.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInAuthEvent, SignInState> {
  final GetRememberMeUseCase _getRememberMeUseCase;
  final SetRememberMeUseCase _setRememberMeUseCase;
  final SetUserInformationUseCase _saveUserInformationUseCase;
  final SetDeviceUserInformationUseCase _setDeviceUserInformationUseCase;
  final SignInUseCase _signInUseCase;
  final SignInValidationUseCase _signInValidationUseCase;
  final SetNotificationStatusUseCase _setNotificationStatusUseCase;

  SignInBloc(
    this._signInValidationUseCase,
    this._setRememberMeUseCase,
    this._getRememberMeUseCase,
    this._saveUserInformationUseCase,
    this._signInUseCase,
    this._setNotificationStatusUseCase,
    this._setDeviceUserInformationUseCase,
  ) : super(SignInInitialState()) {
    on<SignInEvent>(_onSignInEvent);
    on<ChangeRememberMeValueEvent>(_onChangeRememberMeValueEvent);
    on<NavigateToForgotPasswordScreenEvent>(_onForgetPasswordEvent);
    on<ValidateMobileNumberEvent>(_onValidateUsernameEvent);
    on<ValidatePasswordEvent>(_onValidatePasswordEvent);
    on<GetRememberMeEvent>(_onGetRememberMeEvent);
    on<UserExitFromAppEvent>(_onUserExitFromAppEvent);
    on<SetRememberMeEvent>(_onSetRememberMeEvent);
  }

  bool? isValidMobileNumber = false;
  var phoneType = PhoneNumberType.UNKNOWN;

  FutureOr<void> _onSignInEvent(
      SignInEvent event, Emitter<SignInState> emit) async {
    final validationsState = _signInValidationUseCase.validateFormUseCase(
      mobileNumber: event.mobileNumber,
      password: event.password,
    );
    if (validationsState.isNotEmpty) {
      for (var element in validationsState) {
        if (element == SignInValidationState.mobileNumberEmpty) {
          emit(MobileNumberEmptyFormatState(
            mobileNumberValidatorMessage: event.mobileNumber.isEmpty
                ? S.current.mobileNumberCantBeEmpty
                : S.current.invalidMobileNumber,
          ));
        } else if (element == SignInValidationState.passwordEmpty) {
          emit(PasswordEmptyFormatState(
            passwordValidatorMessage: S.current.passwordCantBeEmpty,
          ));
        }
      }
    } else if (isValidMobileNumber == false &&
        phoneType != PhoneNumberType.MOBILE) {
      emit(MobileNumberEmptyFormatState(
        mobileNumberValidatorMessage: event.mobileNumber.isEmpty
            ? S.current.mobileNumberCantBeEmpty
            : S.current.invalidMobileNumber,
      ));
    } else {
      emit(ShowLoadingState());
      final DataState<Login> userState = await _signInUseCase(
        SignInRequest(
          mobileNumber: event.mobileNumber,
          password: event.password.trim(),
        ),
      );
      if (userState is DataSuccess) {
        final Login user = userState.data ?? const Login();
        _saveUserInformationUseCase(user.userInfo);
        _setDeviceUserInformationUseCase(user.userDeviceInfo);
        _setNotificationStatusUseCase(user.userDeviceInfo.isAllowNotification);
        emit(SignInSuccessState(
          login: user,
        ));
      } else if (userState is DataFailed) {
        emit(SignInErrorState(errorMessage: userState.message ?? ""));
      }
      emit(HideLoadingState());
    }
  }

  FutureOr<void> _onChangeRememberMeValueEvent(
      ChangeRememberMeValueEvent event, Emitter<SignInState> emit) async {
    emit(ChangeRememberMeValueState(
      rememberMeValue: event.rememberMeValue,
    ));
  }

  FutureOr<void> _onForgetPasswordEvent(
      NavigateToForgotPasswordScreenEvent event, Emitter<SignInState> emit) {
    emit(NavigateToForgotPasswordScreenState());
  }

  FutureOr<void> _onValidateUsernameEvent(
      ValidateMobileNumberEvent event, Emitter<SignInState> emit) async {
    try {
      phoneType = await PhoneNumberUtil.getNumberType(
          event.mobileNumber, event.regionCode);
      isValidMobileNumber = await PhoneNumberUtil.isValidPhoneNumber(
          event.mobileNumber, event.regionCode);

      if (isValidMobileNumber == true && phoneType == PhoneNumberType.MOBILE) {
        emit(MobileNumberFormatValidState());
      } else {
        emit(MobileNumberEmptyFormatState(
          mobileNumberValidatorMessage: event.mobileNumber.isEmpty
              ? S.current.mobileNumberCantBeEmpty
              : S.current.invalidMobileNumber,
        ));
      }
    } catch (e) {
      emit(MobileNumberEmptyFormatState(
        mobileNumberValidatorMessage: event.mobileNumber.isEmpty
            ? S.current.mobileNumberCantBeEmpty
            : S.current.invalidMobileNumber,
      ));
    }
  }

  FutureOr<void> _onValidatePasswordEvent(
      ValidatePasswordEvent event, Emitter<SignInState> emit) {
    SignInValidationState validationState =
        _signInValidationUseCase.validatePassword(
      event.password,
    );
    if (validationState == SignInValidationState.valid) {
      emit(PasswordFormatValidState());
    } else {
      emit(PasswordEmptyFormatState(
        passwordValidatorMessage: S.current.passwordCantBeEmpty,
      ));
    }
  }

  FutureOr<void> _onGetRememberMeEvent(
      GetRememberMeEvent event, Emitter<SignInState> emit) async {
    emit(GetRememberMeState(rememberMe: _getRememberMeUseCase()));
  }

  FutureOr<void> _onUserExitFromAppEvent(
      UserExitFromAppEvent event, Emitter<SignInState> emit) {
    emit(UserExitFromAppState());
  }

  FutureOr<void> _onSetRememberMeEvent(
      SetRememberMeEvent event, Emitter<SignInState> emit) async {
    final bool isSetRemember =
        await _setRememberMeUseCase(event.rememberMeValue);
    if (isSetRemember) {
      emit(SetRememberMeState());
    }
  }
}
