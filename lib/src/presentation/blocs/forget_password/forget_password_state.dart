part of 'forget_password_bloc.dart';

@immutable
abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object?> get props => [
        identityHashCode(
          this,
        ),
      ];
}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}
class ForgetPasswordHideLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordErrorState({
    required this.errorMessage,
  });
}

class EmailEmptyState extends ForgetPasswordState {
  final String emailValidatorMessage;

  EmailEmptyState({
    required this.emailValidatorMessage,
  });
}

class EmailValidState extends ForgetPasswordState {}

class EmailNotValidState extends ForgetPasswordState {
  final String emailValidatorMessage;

  EmailNotValidState({
    required this.emailValidatorMessage,
  });
}
