part of 'more_bloc.dart';

abstract class MoreState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MoreInitial extends MoreState {}

class ShowLoadingState extends MoreState {}

class HideLoadingState extends MoreState {}

class GetUserInformationState extends MoreState {
  final User user;

  GetUserInformationState({
    required this.user,
  });
}

class NavigateToNotificationScreenState extends MoreState {}

class NavigateToChangePasswordScreenState extends MoreState {}

class NavigateBackState extends MoreState {}

class SetLanguageState extends MoreState {
  final String languageCode;

  SetLanguageState({
    required this.languageCode,
  });
}

class GetLanguageState extends MoreState {
  final String languageCode;

  GetLanguageState({
    required this.languageCode,
  });
}

class NavigateToSignInState extends MoreState {}

class SuccessLogoutState extends MoreState {}

class FailureLogoutState extends MoreState {}

class ShowLogoutDialogState extends MoreState {}

class RestartAppWhenLogoutState extends MoreState {}

class SetRestartAppState extends MoreState {}

class SwitchNotificationSuccessState extends MoreState {
  final String massage;
  final bool value;

  SwitchNotificationSuccessState({
    required this.massage,
    required this.value,
  });
}

class SwitchNotificationErrorState extends MoreState {
  final String massage;

  SwitchNotificationErrorState({
    required this.massage,
  });
}

class GetIsActiveNotificationState extends MoreState {
  final bool isActive;

  GetIsActiveNotificationState({
    required this.isActive,
  });
}

class GetLanguagesSuccessState extends MoreState {
  final List<Language> languages;

  GetLanguagesSuccessState({
    required this.languages,
  });
}

class GetLanguagesErrorState extends MoreState {
  final String message;

  GetLanguagesErrorState({
    required this.message,
  });
}
