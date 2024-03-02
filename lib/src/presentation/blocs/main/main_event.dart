part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [identityHashCode(this)];
}

final class NavigateBetweenScreensEvent extends MainEvent {
  final int position;

  NavigateBetweenScreensEvent({this.position = 0});
}

final class NavigateToScanQrCodeScreenEvent extends MainEvent {}

final class GetCurrentUserEvent extends MainEvent {}
