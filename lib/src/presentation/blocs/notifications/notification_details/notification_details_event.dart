part of 'notification_details_bloc.dart';

@immutable
abstract class NotificationDetailsEvent {}

class BackEvent extends NotificationDetailsEvent {}

class HideSkeletonEvent extends NotificationDetailsEvent {}

class GetNotificationDetailsDataEvent extends NotificationDetailsEvent {
  final int notificationId;

  GetNotificationDetailsDataEvent({
    required this.notificationId,
  });
}

class SetLocalNotificationDetailsDataEvent extends NotificationDetailsEvent {}
