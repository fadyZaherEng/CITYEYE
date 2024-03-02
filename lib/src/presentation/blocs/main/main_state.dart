part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  @override
  List<Object> get props => [identityHashCode(this)];
}

 class MainInitial extends MainState {}

 class SuccessNavigateBetweenScreensState extends MainState {
  final int currentPosition;

  SuccessNavigateBetweenScreensState(this.currentPosition);
}

 class SuccessNavigateBetweenScreensForTechnicianState extends MainState {
  final int currentPosition;

  SuccessNavigateBetweenScreensForTechnicianState(this.currentPosition);
}

 class NavigateToScanQrCodeScreenState extends MainState {}

// Get User State
class SuccessFetchCurrentUserState extends MainState {
  final User user;

  SuccessFetchCurrentUserState({
    required this.user,
  });
}

class FailureFetchCurrentUserState extends MainState {}
