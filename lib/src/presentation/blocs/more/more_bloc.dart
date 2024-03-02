import 'dart:async';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notifications_disable_request.dart';
import 'package:city_eye/src/domain/entities/more/language.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_remote_languages_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/notification_disable_use_case.dart';
import 'package:city_eye/src/domain/usecase/remove_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/remove_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_restart_app_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final GetUserInformationUseCase _getUserInformationUseCase;
  final SetLanguageUseCase _setLanguageUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final RemoveUserInformationUseCase _removeUserInformationUseCase;
  final RemoveRememberMeUseCase _removeRememberMeUseCase;
  final SetRestartAppUseCase _setRestartAppUseCase;
  final NotificationsDisableUseCase _notificationsDisableUseCase;
  final GetNotificationStatusUseCase _getNotificationStatusUseCase;
  final SetNotificationStatusUseCase _setNotificationStatusUseCase;
  final GetRemoteLanguagesUseCase _getRemoteLanguagesUseCase;
  List<Language> _languages = [];

  MoreBloc(
    this._getUserInformationUseCase,
    this._setLanguageUseCase,
    this._getLanguageUseCase,
    this._removeUserInformationUseCase,
    this._removeRememberMeUseCase,
    this._setRestartAppUseCase,
    this._notificationsDisableUseCase,
    this._getNotificationStatusUseCase,
    this._setNotificationStatusUseCase,
    this._getRemoteLanguagesUseCase,
  ) : super(MoreInitial()) {
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToChangePasswordScreenEvent>(
        _onNavigateToChangePasswordScreenEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<SetLanguageEvent>(_onSetLanguageEvent);
    on<NavigateToSignInEvent>(_onNavigateToSignInEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ShowLogoutDialogEvent>(_onShowLogoutDialogEvent);
    on<RestartAppWhenLogoutEvent>(_onRestartAppWhenLogoutEvent);
    on<SetRestartAppEvent>(_onSetRestartAppEvent);
    on<GetUserInformationEvent>(_onGetUserInformationEvent);
    on<SetIsActiveNotificationEvent>(_onSetIsActiveNotificationEvent);
    on<GetIsActiveNotificationEvent>(_onGetIsActiveNotificationEvent);
    on<GetRemoteLanguagesEvent>(_onGetLanguagesEvent);
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<MoreState> emit) async {
    String languageCode = _getLanguageUseCase();
    emit(GetLanguageState(languageCode: languageCode));
  }

  FutureOr<void> _onSetLanguageEvent(
      SetLanguageEvent event, Emitter<MoreState> emit) async {
    await _setLanguageUseCase(event.languageCode);
    emit(SetLanguageState(languageCode: event.languageCode));
  }

  FutureOr<void> _onGetUserInformationEvent(
      GetUserInformationEvent event, Emitter<MoreState> emit) async {
    final User user = _getUserInformationUseCase();
    emit(GetUserInformationState(user: user));
  }

  Future<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<MoreState> emit) async {
    emit(NavigateToNotificationScreenState());
  }

  Future<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<MoreState> emit) async {
    emit(NavigateBackState());
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<MoreState> emit) async {
    final isRemovedUser = await _removeUserInformationUseCase();
    final isRemovedRememberMe = await _removeRememberMeUseCase();
    if (isRemovedUser && isRemovedRememberMe) {
      emit(SuccessLogoutState());
    } else if (isRemovedUser && !isRemovedRememberMe) {
      emit(SuccessLogoutState());
    }
  }

  FutureOr<void> _onNavigateToSignInEvent(
      NavigateToSignInEvent event, Emitter<MoreState> emit) {
    emit(NavigateToSignInState());
  }

  FutureOr<void> _onShowLogoutDialogEvent(
      ShowLogoutDialogEvent event, Emitter<MoreState> emit) {
    emit(ShowLogoutDialogState());
  }

  FutureOr<void> _onRestartAppWhenLogoutEvent(
      RestartAppWhenLogoutEvent event, Emitter<MoreState> emit) {
    emit(RestartAppWhenLogoutState());
  }

  FutureOr<void> _onNavigateToChangePasswordScreenEvent(
      NavigateToChangePasswordScreenEvent event, Emitter<MoreState> emit) {
    emit(NavigateToChangePasswordScreenState());
  }

  Future<FutureOr<void>> _onSetRestartAppEvent(
      SetRestartAppEvent event, Emitter<MoreState> emit) async {
    final isSetRestart = await _setRestartAppUseCase(true);
    if (isSetRestart) {
      emit(SetRestartAppState());
    }
  }

  FutureOr<void> _onSetIsActiveNotificationEvent(
      SetIsActiveNotificationEvent event, Emitter<MoreState> emit) async {
    emit(ShowLoadingState());
    final DataState dataState = await _notificationsDisableUseCase(
      NotificationsDisableRequest(status: event.isActive),
    );
    if (dataState is DataSuccess) {
      await _setNotificationStatusUseCase(event.isActive);
      emit(SwitchNotificationSuccessState(
        value: event.isActive,
        massage: dataState.message ?? "",
      ));
    } else if (dataState is DataFailed) {
      emit(SwitchNotificationErrorState(massage: dataState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetIsActiveNotificationEvent(
      GetIsActiveNotificationEvent event, Emitter<MoreState> emit) async {
    bool isActive = _getNotificationStatusUseCase();
    emit(GetIsActiveNotificationState(isActive: isActive));
  }

  FutureOr<void> _onGetLanguagesEvent(
      GetRemoteLanguagesEvent event, Emitter<MoreState> emit) async {
    if (_languages.isNotEmpty) {
      emit(GetLanguagesSuccessState(languages: _languages));
      return;
    }
    emit(ShowLoadingState());
    DataState dataState = await _getRemoteLanguagesUseCase();
    _languages = dataState.data ?? [];
    if (dataState is DataSuccess) {
      emit(GetLanguagesSuccessState(languages: dataState.data ?? []));
    } else {
      emit(GetLanguagesErrorState(message: dataState.message ?? ""));
    }
    emit(HideLoadingState());
  }
}
