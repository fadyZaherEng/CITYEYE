part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class ShowSkeletonState extends NotificationsState {}

class ShowLoadingState extends NotificationsState {}

class HideLoadingState extends NotificationsState {}

class NotificationsPopState extends NotificationsState {}

// ignore: must_be_immutable
class NotificationClickActionState extends NotificationsState {
  NotificationItem notificationItem;

  NotificationClickActionState(this.notificationItem);
}

class GetNotificationsSuccessState extends NotificationsState {
  final List<NotificationItem> notifications;

  GetNotificationsSuccessState({required this.notifications});
}

class GetNotificationsErrorState extends NotificationsState {
  final String errorMessage;

  GetNotificationsErrorState({required this.errorMessage});
}

class UpdateNotificationSeenSuccessState extends NotificationsState {
  final NotificationItem notificationItem;
  final String message;

  UpdateNotificationSeenSuccessState(
      {required this.message, required this.notificationItem});
}

class UpdateNotificationSeenFailedState extends NotificationsState {
  final String errorMessage;

  UpdateNotificationSeenFailedState(this.errorMessage);
}
