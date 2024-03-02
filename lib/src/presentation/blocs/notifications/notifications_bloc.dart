import 'dart:async';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/usecase/notifications/get_notifications_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/update_notification_seen_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final UpdateNotificationSeenUseCase _updateNotificationSeenUseCase;

  NotificationsBloc(
      this._getNotificationsUseCase, this._updateNotificationSeenUseCase)
      : super(ShowSkeletonState()) {
    on<GetNotificationsDataEvent>(_onGetNotificationsDataEvent);
    on<NotificationsPopEvent>(_onNotificationsPopEvent);
    on<NotificationClickActionEvent>(_onNotificationClickActionEvent);
    on<UpdateNotificationSeenEvent>(_onUpdateNotificationSeenEvent);
  }

  FutureOr<void> _onGetNotificationsDataEvent(
      GetNotificationsDataEvent event, Emitter<NotificationsState> emit) async {
    emit(ShowSkeletonState());
    DataState dataState = await _getNotificationsUseCase();
    if (dataState is DataSuccess<List<NotificationItem>>) {
      emit(GetNotificationsSuccessState(notifications: dataState.data ?? []));
    } else {
      emit(GetNotificationsErrorState(errorMessage: dataState.message ?? ""));
    }
  }

  FutureOr<void> _onNotificationsPopEvent(
      NotificationsPopEvent event, Emitter<NotificationsState> emit) {
    emit(NotificationsPopState());
  }

  FutureOr<void> _onNotificationClickActionEvent(
      NotificationClickActionEvent event, Emitter<NotificationsState> emit) {
    emit(NotificationClickActionState(event.notificationItem));
  }

  FutureOr<void> _onUpdateNotificationSeenEvent(
      UpdateNotificationSeenEvent event,
      Emitter<NotificationsState> emit) async {
    emit(ShowLoadingState());

    final DataState dataState =
        await _updateNotificationSeenUseCase(event.notificationSeenRequest);

    if (dataState is DataSuccess) {
      emit(UpdateNotificationSeenSuccessState(
        notificationItem: event.notificationItem,
        message: dataState.message ?? "",
      ));
    } else if (dataState is DataFailed) {
      emit(UpdateNotificationSeenFailedState(dataState.message ?? ""));
    }
    emit(HideLoadingState());
  }
}
