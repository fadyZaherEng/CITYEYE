import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/change_password/request/change_password_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/language/remote_language.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/more_api_service.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/entity/remote_notification_item.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_details_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notifications_disable_request.dart';
import 'package:city_eye/src/domain/entities/more/language.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';
import 'package:dio/dio.dart';

final class MoreRepositoryImplementation implements MoreRepository {
  final MoreAPIService _moreAPIService;

  MoreRepositoryImplementation(this._moreAPIService);

  @override
  Future<DataState<List<NotificationItem>>> getNotifications() async {
    try {
      final CityEyeTechRequest request =
          CityEyeTechRequest().createRequest(null);
      final httpResponse = await _moreAPIService.getNotifications(request);
      if ((httpResponse.data.statusCode ?? 400) == 200 &&
          (httpResponse.data.success ?? false)) {
        return DataSuccess(
          data: (httpResponse.data.result ?? const []).mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState<NotificationItem>> getNotificationDetails(
      NotificationDetailsRequest notificationDetailsRequest) async {
    try {
      final request = CityEyeTechRequest<NotificationDetailsRequest>()
          .createRequest(notificationDetailsRequest);
      final httpResponse = await _moreAPIService.getNotificationById(request);
      if ((httpResponse.data.statusCode ?? 400) == 200 &&
          (httpResponse.data.success ?? false)) {
        return DataSuccess(
          data: (httpResponse.data.result ?? const RemoteNotificationItem())
              .mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState<String>> disableNotifications(
      NotificationsDisableRequest notificationsDisableRequest) async {
    try {
      final request = CityEyeTechRequest<NotificationsDisableRequest>()
          .createRequest(notificationsDisableRequest);
      final httpResponse = await _moreAPIService.disableNotifications(request);
      if ((httpResponse.data.statusCode ?? 400) == 200 &&
          (httpResponse.data.success ?? false)) {
        return DataSuccess(
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState> resetPassword(
      ChangePasswordRequest changePasswordRequest) async {
    try {
      final request = CityEyeTechRequest<ChangePasswordRequest>()
          .createRequest(changePasswordRequest);
      final httpResponse = await _moreAPIService.resetPassword(request);
      if ((httpResponse.data.statusCode ?? 400) == 200 &&
          (httpResponse.data.success ?? false)) {
        return DataSuccess(
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState<List<Language>>> getLanguage() async {
    try {
      CityEyeTechRequest request =
          await CityEyeTechRequest().createRequest(null);
      final httpResponse = await _moreAPIService.getLanguage(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? const []).mapToDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }

      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState> updateNotificationAsSeen(
      NotificationSeenRequest notificationSeenRequest) async {
    try {
      final request = CityEyeTechRequest<NotificationSeenRequest>()
          .createRequest(notificationSeenRequest);
      final httpResponse =
          await _moreAPIService.updateNotificationAsSeen(request);
      if ((httpResponse.data.statusCode ?? 400) == 200 &&
          (httpResponse.data.success ?? false)) {
        return DataSuccess(
          message: httpResponse.data.responseMessage ?? "",
          data: "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }
}
