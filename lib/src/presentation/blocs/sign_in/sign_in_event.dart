part of 'sign_in_bloc.dart';

@immutable
class SignInAuthEvent extends Equatable {
  @override
  List<Object?> get props => [
        identityHashCode(this),
      ];
}

class SignInEvent extends SignInAuthEvent {
  final String mobileNumber;
  final String password;

  SignInEvent({
    required this.mobileNumber,
    required this.password,
  });
}

class ChangeRememberMeValueEvent extends SignInAuthEvent {
  final bool rememberMeValue;

  ChangeRememberMeValueEvent({
    required this.rememberMeValue,
  });
}

class NavigateToForgotPasswordScreenEvent extends SignInAuthEvent {}

class ValidateMobileNumberEvent extends SignInAuthEvent {
  final String mobileNumber;
  final String regionCode;

  ValidateMobileNumberEvent({
    required this.mobileNumber,
    required this.regionCode,
  });
}

class ValidatePasswordEvent extends SignInAuthEvent {
  final String password;

  ValidatePasswordEvent({
    required this.password,
  });
}

class GetRememberMeEvent extends SignInAuthEvent {}

class UserExitFromAppEvent extends SignInAuthEvent {}

final class SetRememberMeEvent extends SignInAuthEvent {
  final bool rememberMeValue;

  SetRememberMeEvent({
    required this.rememberMeValue,
  });
}
