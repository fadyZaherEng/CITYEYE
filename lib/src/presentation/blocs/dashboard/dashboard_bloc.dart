// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_qr_number_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_support_request.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/request/get_lock_up_data_rows_request.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/service_data.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_all_user_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_last_5_day_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_top_five_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_qr_number_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_qr_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_support_number_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_tech_support_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_notifications_count_use_case.dart';
import 'package:city_eye/src/domain/usecase/lock_up_data/get_lock_up_rows_use_case.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetLockUpRowsUseCase _getLockUpRowsUseCase;
  final GetQrNumberUseCase _getQrNumberUseCase;
  final GetSupportNumberUseCase _getSupportNumberUseCase;
  final GetCompoundAllUserUseCase _getCompoundAllUserUseCase;
  final GetCompoundTopFiveUseCase _getCompoundTopFiveUseCase;
  final GetNotificationsCountUseCase _getNotificationsCountUseCase;
  final GetQrStatusUseCase _getQrStatusUseCase;
  final GetTechSupportStatusUseCase _getTechSupportStatusUseCase;
  final GetCompoundLast5DayCashFlowUseCase _getCompoundLast5DayCashFlowUseCase;

  DashboardBloc(
    this._getLockUpRowsUseCase,
    this._getQrNumberUseCase,
    this._getSupportNumberUseCase,
    this._getCompoundAllUserUseCase,
    this._getCompoundTopFiveUseCase,
    this._getNotificationsCountUseCase,
    this._getQrStatusUseCase,
    this._getTechSupportStatusUseCase,
    this._getCompoundLast5DayCashFlowUseCase,
  ) : super(DashboardInitial()) {
    on<DashboardGetLookupRowsEvent>(_onDashboardGetLookupRowsEvent);
    on<DashboardGetQrNumbersEvent>(_onDashboardGetQrNumbersEvent);
    on<DashboardGetCompoundAllUserStatusEvent>(
        _onDashboardGetCompoundAllUserStatusEvent);
    on<DashboardGetSupportRequestNumbersEvent>(
        _onDashboardGetSupportRequestNumbersEvent);
    on<DashboardGetTopFiveRequestNumbersEvent>(
        _onDashboardGetCompoundTopFiveEvent);
    on<DashBoardBottomSheetCloseEvent>(_onDashBoardBottomSheetCloseEvent);

    on<DashboardIsOpacityFilterButtonFromUserStatesEvent>(
        _onDashboardIsOpacityFilterButtonFromUserStatesEvent);

    on<DashboardIsOpacityFilterButtonFromMaintainanceEvent>(
        _onDashboardIsOpacityFilterButtonFromMaintainanceEvent);
    on<DashboardPopBackEvent>(_onDashboardPopBackEvent);
    on<DashboardGetNotificationsCountEvent>(_onGetNotificationCountEvent);
    on<DashboardGetQrStatusEvent>(_onGetQrStatusEvent);
    on<DashboardGetTechSupportStatusEvent>(
        _onDashboardGetTechSupportStatusEvent);
    on<DashboardGetCompoundTopFiveCashFlowEvent>(
        _onDashboardGetCompoundLast5DayCashFlowEvent);
  }

  FutureOr<void> _onDashboardGetLookupRowsEvent(
      DashboardGetLookupRowsEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardGetLookupRowsLoading());
    emit(DashboardGetCompoundAllUserStatusSkeleton());
    final DataState<List<GetLockUpRows>> getLockUpRowsState =
        await _getLockUpRowsUseCase(getLockUpDataRowsRequest: [
      const GetLockUpDataRowsRequest(
        lookupCode: "QRType",
      ),
      const GetLockUpDataRowsRequest(
        lookupCode: "guestType",
      ),
    ]);
    if (getLockUpRowsState is DataSuccess) {
      emit(DashboardGetLookupRowsSuccess(
          getLockUpRows: getLockUpRowsState.data ?? []));
    } else if (getLockUpRowsState is DataFailed) {
      emit(DashboardGetLookupRowsError(
          errorMessage: getLockUpRowsState.message ?? ""));
    }
  }

  FutureOr<void> _onDashboardGetQrNumbersEvent(
      DashboardGetQrNumbersEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardGetQrNumberLoading());
    final DataState<GetQrNumber> getQrNumberState = await _getQrNumberUseCase(
        getQrNumberRequest: GetQrNumberRequest(
      fromDate: event.bottomSheetFromDate,
      guestTypeId: event.guestTypeId,
      qrStatusId: event.qrStatusId,
      qrTypeId: event.qrTypeId,
      toDate: event.bottomSheetToDate,
    ));
    if (getQrNumberState is DataSuccess) {
      emit(
        DashboardGetQrNumberSuccess(
          getQrNumber: getQrNumberState.data ?? const GetQrNumber(),
          bottomSheetToDate: event.bottomSheetToDate,
          bottomSheetFromDate: event.bottomSheetFromDate,
          guestTypeIndex: event.guestTypeIndex,
          qrTypeIndex: event.qrTypeIndex,
          getQrStatusIndex: event.getQrStatusIndex,
          isComeFromBottomSheet: event.isComeFromBottomSheet,
          isButtonClicked: false,
          isButtonOpacity: false,
        ),
      );
    } else if (getQrNumberState is DataFailed) {
      emit(DashboardGetQrNumberError(
          errorMessage: getQrNumberState.message ?? ""));
    }
  }

  FutureOr<void> _onDashboardGetCompoundAllUserStatusEvent(
      DashboardGetCompoundAllUserStatusEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardGetCompoundAllUserStatusSkeleton());
    final DataState<GetCompoundAllUserStatus> getCompoundAllUserStatusState =
        await _getCompoundAllUserUseCase();
    if (getCompoundAllUserStatusState is DataSuccess) {
      emit(DashboardGetCompoundAllUserStatusSuccess(
        getCompoundAllUserStatus: getCompoundAllUserStatusState.data!,
      ));
    } else if (getCompoundAllUserStatusState is DataFailed) {
      emit(DashboardGetCompoundAllUserStatusError(
          errorMessage: getCompoundAllUserStatusState.message ?? ""));
    }
  }

  FutureOr<void> _onDashboardGetSupportRequestNumbersEvent(
      DashboardGetSupportRequestNumbersEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardGetSupportRequestNumbersLoading());
    final DataState<GetSupportNumber> getSupportNumberState =
        await _getSupportNumberUseCase(
            getSupportRequest: GetSupportRequest(
      fromDate: event.bottomSheetFromDate,
      toDate: event.bottomSheetToDate,
      supportStatusId: event.supportStatusId,
    ));
    if (getSupportNumberState is DataSuccess) {
      emit(DashboardGetSupportRequestNumbersSuccess(
        getSupportRequestNumbers:
            getSupportNumberState.data ?? const GetSupportNumber(),
        isComeFromBottomSheet: event.isComeFromBottomSheet,
        bottomSheetFromDate: event.bottomSheetFromDate,
        bottomSheetToDate: event.bottomSheetToDate,
        supportStatusIndex: event.supportStatusIndex,
        isButtonClicked: false,
        isButtonOpacity: false,
      ));
    } else if (getSupportNumberState is DataFailed) {
      emit(DashboardGetSupportRequestNumbersError(
          errorMessage: getSupportNumberState.message ?? ""));
    }
  }

  FutureOr<void> _onDashboardGetCompoundTopFiveEvent(
      DashboardGetTopFiveRequestNumbersEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardGetTopFiveUsersLoading());
    final DataState<List<ServiceData>> getTopFiveRequestNumberState =
        await _getCompoundTopFiveUseCase();
    if (getTopFiveRequestNumberState is DataSuccess) {
      List<GetTopFiveUsers> users = [];
      double total = 0;
      getTopFiveRequestNumberState.data?.forEach((element) {
        total += element.countOfUsers;
      });

      getTopFiveRequestNumberState.data?.forEach((element) {
        users.add(
          GetTopFiveUsers(
            name: element.serviceCategory.name,
            count: element.countOfUsers,
            percentage: (element.countOfUsers / total) * 100,
          ),
        );
      });

      emit(DashboardGetTopFiveUsersSuccess(
        getTopFiveUsers: users,
      ));
    }
    if (getTopFiveRequestNumberState is DataFailed) {
      emit(DashboardGetTopFiveUsersError(
          errorMessage: getTopFiveRequestNumberState.message ?? ""));
    }
  }

  FutureOr<void> _onDashBoardBottomSheetCloseEvent(
      DashBoardBottomSheetCloseEvent event, Emitter<DashboardState> emit) {
    emit(DashBoardBottomSheetCloseState(
      isButtonClicked: false,
      isButtonOpacity: false,
    ));
  }

  FutureOr<void> _onDashboardIsOpacityFilterButtonFromUserStatesEvent(
      DashboardIsOpacityFilterButtonFromUserStatesEvent event,
      Emitter<DashboardState> emit) {
    emit(DashboardIsOpacityFilterButtonFromUserStates(
        isCanOpacity: !event.isCanOpacity));
  }

  FutureOr<void> _onDashboardIsOpacityFilterButtonFromMaintainanceEvent(
      DashboardIsOpacityFilterButtonFromMaintainanceEvent event,
      Emitter<DashboardState> emit) {
    emit(DashboardIsOpacityFilterButtonFromMaintainance(
        isCanOpacity: !event.isCanOpacity));
  }

  FutureOr<void> _onDashboardPopBackEvent(
      DashboardPopBackEvent event, Emitter<DashboardState> emit) {
    emit(DashboardPopBackState());
  }

  FutureOr<void> _onGetNotificationCountEvent(
      DashboardGetNotificationsCountEvent event,
      Emitter<DashboardState> emit) async {
    DataState<NotificationCount> dataState =
        await _getNotificationsCountUseCase();
    if (dataState is DataSuccess) {
      NotificationCount notificationCount =
          dataState.data ?? const NotificationCount();
      emit(GetNotificationCountSuccessState(
        count: notificationCount.count,
      ));
    } else {
      emit(GetNotificationCountFailedState(
        errorMessage: dataState.message ?? "",
      ));
    }
  }

  FutureOr<void> _onGetQrStatusEvent(
      DashboardGetQrStatusEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardGetQrStatusLoading());
    DataState<List<GetQrStatus>> dataState = await _getQrStatusUseCase();
    if (dataState is DataSuccess) {
      emit(DashboardGetQrStatusSuccess(
        getQrStatus: dataState.data ?? [],
      ));
    }
    if (dataState is DataFailed) {
      emit(DashboardGetQrStatusError(
        errorMessage: dataState.message ?? "",
      ));
    }
  }

  FutureOr<void> _onDashboardGetTechSupportStatusEvent(
      DashboardGetTechSupportStatusEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardGetTechSupportStatusLoading());
    DataState<List<GetTechSupportStatus>> dataState =
        await _getTechSupportStatusUseCase();
    if (dataState is DataSuccess) {
      emit(DashboardGetTechSupportStatusSuccess(
        getTechSupportStatus: dataState.data ?? [],
      ));
    }
    if (dataState is DataFailed) {
      emit(DashboardGetTechSupportStatusError(
        errorMessage: dataState.message ?? "",
      ));
    }
  }

  FutureOr<void> _onDashboardGetCompoundLast5DayCashFlowEvent(
      DashboardGetCompoundTopFiveCashFlowEvent event,
      Emitter<DashboardState> emit) async {
    emit(DashboardGetCompoundLastFiveDayCashFlowLoading());
    DataState<List<GetCompoundLast5DayCashFlow>> dataState =
        await _getCompoundLast5DayCashFlowUseCase();
    if (dataState is DataSuccess) {
      emit(DashboardGetCompoundLastFiveDayCashFlowSuccess(
        getCompoundLastFiveDayCashFlow: dataState.data ?? [],
      ));
    }
    if (dataState is DataFailed) {
      emit(DashboardGetCompoundLastFiveDayCashFlowError(
        errorMessage: dataState.message ?? "",
      ));
    }
  }
}
