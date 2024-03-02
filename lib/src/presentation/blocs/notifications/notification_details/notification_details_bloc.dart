import 'dart:async';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_details_request.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/usecase/notifications/get_notification_details_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_details_event.dart';
part 'notification_details_state.dart';

class NotificationDetailsBloc
    extends Bloc<NotificationDetailsEvent, NotificationDetailsState> {
  final GetNotificationDetailsUseCase _getNotificationDetailsUseCase;

  NotificationDetailsBloc(
    this._getNotificationDetailsUseCase,
  ) : super(ShowSkeletonState()) {
    on<BackEvent>(_onBackEvent);
    on<GetNotificationDetailsDataEvent>(_onGetNotificationDetailsDataEvent);
    on<SetLocalNotificationDetailsDataEvent>(
        _onSetLocalNotificationDetailsDataEvent);
    on<HideSkeletonEvent>(_onHideSkeletonEvent);
  }

  FutureOr<void> _onBackEvent(
      BackEvent event, Emitter<NotificationDetailsState> emit) {
    emit(BackState());
  }

  FutureOr<void> _onGetNotificationDetailsDataEvent(
      GetNotificationDetailsDataEvent event,
      Emitter<NotificationDetailsState> emit) async {
    emit(ShowSkeletonState());
    DataState dataState = await _getNotificationDetailsUseCase(
        NotificationDetailsRequest(id: event.notificationId));
    if (dataState is DataSuccess<NotificationItem>) {
      emit(GetNotificationDetailsSuccessState(
          notificationItem: dataState.data ?? const NotificationItem()));
    } else {
      emit(GetNotificationDetailsErrorState(
          errorMessage: dataState.message ?? ""));
    }
  }

  FutureOr<void> _onSetLocalNotificationDetailsDataEvent(
      SetLocalNotificationDetailsDataEvent event,
      Emitter<NotificationDetailsState> emit) {
    emit(SetLocalNotificationDetailsDataState());
  }

  FutureOr<void> _onHideSkeletonEvent(
      HideSkeletonEvent event, Emitter<NotificationDetailsState> emit) {
    emit(HideSkeletonState());
  }
}
