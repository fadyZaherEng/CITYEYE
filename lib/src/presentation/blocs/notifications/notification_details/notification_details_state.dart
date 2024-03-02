part of 'notification_details_bloc.dart';

@immutable
abstract class NotificationDetailsState {}

class NotificationDetailsInitial extends NotificationDetailsState {}

class ShowSkeletonState extends NotificationDetailsState {}

class HideSkeletonState extends NotificationDetailsState {}

class BackState extends NotificationDetailsState {}

class GetNotificationDetailsSuccessState extends NotificationDetailsState {
  final NotificationItem notificationItem;

  GetNotificationDetailsSuccessState({required this.notificationItem});
}

class GetNotificationDetailsErrorState extends NotificationDetailsState {
  final String errorMessage;

  GetNotificationDetailsErrorState({required this.errorMessage});
}

class SetLocalNotificationDetailsDataState extends NotificationDetailsState {}
