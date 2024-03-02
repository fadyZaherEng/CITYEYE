import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/change_password/request/change_password_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_details_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notifications_disable_request.dart';
import 'package:city_eye/src/domain/entities/more/language.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';

abstract interface class MoreRepository {
  Future<DataState<List<NotificationItem>>> getNotifications();

  Future<DataState<NotificationItem>> getNotificationDetails(
      NotificationDetailsRequest notificationDetailsRequest);

  Future<DataState<String>> disableNotifications(
      NotificationsDisableRequest notificationsDisableRequest);

  Future<DataState> resetPassword(ChangePasswordRequest changePasswordRequest);

  Future<DataState<List<Language>>> getLanguage();

  Future<DataState> updateNotificationAsSeen(NotificationSeenRequest notificationSeenRequest);
}
