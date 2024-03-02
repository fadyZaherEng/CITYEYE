part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

//class GetUserInformationEvent extends MoreEvent {}

class NavigateToNotificationScreenEvent extends MoreEvent {}

class NavigateToChangePasswordScreenEvent extends MoreEvent {}

class NavigateBackEvent extends MoreEvent {}

class SetLanguageEvent extends MoreEvent {
  final String languageCode;

  SetLanguageEvent({
    required this.languageCode,
  });
}

class GetLanguageEvent extends MoreEvent {}

class NavigateToSignInEvent extends MoreEvent {}

class LogoutEvent extends MoreEvent {}

class ShowLogoutDialogEvent extends MoreEvent {}

class RestartAppWhenLogoutEvent extends MoreEvent {}

class SetRestartAppEvent extends MoreEvent {}

class GetUserInformationEvent extends MoreEvent {}

class SetIsActiveNotificationEvent extends MoreEvent {
  final bool isActive;

  SetIsActiveNotificationEvent({required this.isActive});
}

class GetIsActiveNotificationEvent extends MoreEvent {}

class GetRemoteLanguagesEvent extends MoreEvent {}