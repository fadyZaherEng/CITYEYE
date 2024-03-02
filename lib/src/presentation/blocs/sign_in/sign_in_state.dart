part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [
        identityHashCode(this),
      ];
}

class SignInInitialState extends SignInState {}

class ShowLoadingState extends SignInState {}

class HideLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final Login login;
  SignInSuccessState({
    required this.login,
  });
}

class SignInErrorState extends SignInState {
  final String errorMessage;

  SignInErrorState({
    required this.errorMessage,
  });
}

class ChangeRememberMeValueState extends SignInState {
  final bool rememberMeValue;

  ChangeRememberMeValueState({
    required this.rememberMeValue,
  });
}

class NavigateToForgotPasswordScreenState extends SignInState {}

class MobileNumberEmptyFormatState extends SignInState {
  final String mobileNumberValidatorMessage;

  MobileNumberEmptyFormatState({
    required this.mobileNumberValidatorMessage,
  });
}

class PasswordEmptyFormatState extends SignInState {
  final String passwordValidatorMessage;

  PasswordEmptyFormatState({
    required this.passwordValidatorMessage,
  });
}

class MobileNumberFormatValidState extends SignInState {}

class PasswordFormatValidState extends SignInState {}

class ValidSignInFormState extends SignInState {
  final String phoneNumber;
  final String password;

  ValidSignInFormState({
    required this.phoneNumber,
    required this.password,
  });
}

class GetRememberMeState extends SignInState {
  final bool rememberMe;

  GetRememberMeState({required this.rememberMe});
}

class UserExitFromAppState extends SignInState {}

class SetRememberMeState extends SignInState {}
