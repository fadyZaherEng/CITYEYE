import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/add_stuff_attendance_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/usecase/home/add_stuff_attendance_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_notifications_count_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_stuff_attendance_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_validate_visitor_qr_code_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_visitors_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_supports_use_case.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_enum.dart';
import 'package:city_eye/src/presentation/screens/home/utils/home_extension.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetStuffAttendanceInformationUseCase
      _getStuffAttendanceInformationUseCase;
  final AddStuffAttendanceUseCase _addStuffAttendanceInformationUseCase;
  final GetVisitorsUseCase _getVisitorUseCase;
  final GetSupportsUseCase _getSupportsUseCase;
  final GetValidateVisitorQrCodeUseCase _getValidateVisitorQrCodeUseCase;
  final GetNotificationsCountUseCase _getNotificationsCountUseCase;

  HomeBloc(
    this._getStuffAttendanceInformationUseCase,
    this._addStuffAttendanceInformationUseCase,
    this._getVisitorUseCase,
    this._getValidateVisitorQrCodeUseCase,
    this._getSupportsUseCase,
    this._getNotificationsCountUseCase,
  ) : super(ShowSkeletonState()) {
    on<GetVisitorsEvent>(_onGetVisitorsEvent);
    on<GetJobsEvent>(_onGetJobsEvent);
    on<ShowPinCodeBottomSheetForSecurityEvent>(
        _onShowPinCodeBottomSheetForSecurityEvent);
    on<ShowPinCodeBottomSheetForTechnicalEvent>(
        _onShowPinCodeBottomSheetForTechnicalEvent);
    on<GetNotificationCountEvent>(_onGetNotificationCountEvent);
    on<NavigateToJobDetailsScreenEvent>(_onNavigateToJobDetailsScreenEvent);
    on<SearchVisitorEvent>(_onSearchVisitorEvent);
    on<SearchJobEvent>(_onSearchJobEvent);
    on<CheckInEvent>(_onCheckInEvent);
    on<CheckOutEvent>(_onCheckOutEvent);
    on<GetUserAttendanceInformationEvent>(_onGetUserAttendanceInformationEvent);
    on<ClearSearchVisitorEvent>(_onClearSearchVisitorEvent);
    on<ClearSearchJobEvent>(_onClearSearchJobEvent);
    on<ValidationPinCodeEvent>(_onValidationPinCodeEvent);
    on<ValidationVisitorPinCodeEvent>(_onValidationVisitorPinCodeEvent);
    on<RemoveValuesFromPinCodeTextFieldEvent>(
        _onRemoveValuesFromPinCodeTextFieldEvent);
    on<ChangeJobItemSupportEvent>(_onChangeJobItemSupportEvent);
    on<NavigateToQrDetailsScreenEvent>(_onNavigateToQrDetailsScreenEvent);
  }

  List<Visitor> _visitors = [];

  List<Support> _jobs = [];

  Future<void> _onGetVisitorsEvent(
      GetVisitorsEvent event, Emitter<HomeState> emit) async {
    if(event.isShowLoading) {
      emit(ShowLoadingState());
    }

    final visitorsState = await _getVisitorUseCase();


    if (visitorsState is DataSuccess<List<Visitor>>) {
      _visitors = List.from(visitorsState.data ?? []);
      final filteredVisitors = _visitors
          .where(
            (visitor) =>
        visitor.guestName.toLowerCase().contains(event.searchValue) ||
            visitor.ownerName.toLowerCase().contains(event.searchValue) ||
            visitor.qrType.name.toLowerCase().contains(event.searchValue) ||
            visitor.guestType.name.toLowerCase().contains(event.searchValue),
      )
          .toList();

      emit(SuccessFetchAllVisitorsState(
          visitors: filteredVisitors));
    } else if (visitorsState is DataFailed) {
      emit(FailureFetchAllVisitorsState(
          errorMessage: visitorsState.message ?? ""));
    }

    if(event.isShowLoading) {
      emit(HideLoadingState());
    }
  }

  Future<void> _onGetJobsEvent(
      GetJobsEvent event, Emitter<HomeState> emit) async {
    if(event.isShowLoading) {
      emit(ShowLoadingState());
    }

    final DataState<List<Support>> supportsState = await _getSupportsUseCase();
    _jobs = List.from(supportsState.data ?? []);
    var filteredJobs = [];

    filteredJobs = _jobs
        .where(
          (job) =>
      job.requestId.toString().contains(event.searchValue) ||
          job.supportCategory.name.toLowerCase().contains(event.searchValue),
    )
        .toList();


    if (supportsState is DataSuccess) {
      emit(
        SuccessFetchAllJobsState(
          jobs: List.from(
            filteredJobs,
          ),
        ),
      );
    } else if (supportsState is DataFailed) {
      emit(FailureFetchAllJobsState(message: supportsState.message ?? ""));
    }

    if(event.isShowLoading) {
      emit(HideLoadingState());
    }
  }

  Future<void> _onShowPinCodeBottomSheetForSecurityEvent(
      ShowPinCodeBottomSheetForSecurityEvent event,
      Emitter<HomeState> emit) async {
    emit(ShowBottomSheetWidgetForSecurityState());
  }

  Future<void> _onShowPinCodeBottomSheetForTechnicalEvent(
      ShowPinCodeBottomSheetForTechnicalEvent event,
      Emitter<HomeState> emit) async {
    emit(ShowBottomSheetWidgetForTechnicalState());
  }

  FutureOr<void> _onNavigateToJobDetailsScreenEvent(
      NavigateToJobDetailsScreenEvent event, Emitter<HomeState> emit) {
    emit(NavigateToJobDetailsScreenState(id: event.id));
  }

  FutureOr<void> _onSearchVisitorEvent(
      SearchVisitorEvent event, Emitter<HomeState> emit) {
    String value = event.value.trim().toLowerCase();
    if (value.isNotEmpty) {
      final filteredVisitors = _visitors
          .where(
            (visitor) =>
                visitor.guestName.toLowerCase().contains(value) ||
                visitor.ownerName.toLowerCase().contains(value) ||
                visitor.qrType.name.toLowerCase().contains(value) ||
                visitor.guestType.name.toLowerCase().contains(value),
          )
          .toList();
      if (filteredVisitors.isNotEmpty) {
        emit(SearchVisitorState(filteredVisitors));
      } else {
        emit(SearchVisitorState(const []));
      }
    } else {
      emit(SearchVisitorState(_visitors));
    }
  }

  FutureOr<void> _onSearchJobEvent(
      SearchJobEvent event, Emitter<HomeState> emit) {
    String value = event.searchedValue.trim().toLowerCase();
    if (value.isNotEmpty) {
      final filteredJobs = _jobs
          .where(
            (job) =>
                job.requestId.toString().contains(value) ||
                job.supportCategory.name.toLowerCase().contains(value),
          )
          .toList();
      if (filteredJobs.isNotEmpty) {
        emit(SearchJobState(filteredJobs));
      } else {
        emit(SearchJobState(const []));
      }
    } else {
      emit(SearchJobState(_jobs));
    }
  }

  FutureOr<void> _onCheckInEvent(
      CheckInEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final isCheckInState = await _addStuffAttendanceInformationUseCase(
      AddStuffAttendanceRequest(
        attendanceTypeName: CheckingStatus.checkIn.toStatus,
        logitude: '',
        latitude: '',
      ),
    );
    if (isCheckInState is DataSuccess<UserAttendanceInformation>) {
      emit(CheckInSuccessState(
          successMessage: isCheckInState.message ?? "",
          stuffAttendanceChecking:
              isCheckInState.data ?? const UserAttendanceInformation()));
    } else if (isCheckInState is DataFailed) {
      emit(CheckInErrorState(errorMessage: isCheckInState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onCheckOutEvent(
      CheckOutEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final isCheckOutState = await _addStuffAttendanceInformationUseCase(
      AddStuffAttendanceRequest(
        attendanceTypeName: CheckingStatus.checkOut.toStatus,
        logitude: '',
        latitude: '',
      ),
    );
    if (isCheckOutState is DataSuccess<UserAttendanceInformation>) {
      emit(CheckOutSuccessState(
          successMessage: isCheckOutState.message ?? "",
          stuffAttendanceChecking:
              isCheckOutState.data ?? const UserAttendanceInformation()));
    } else if (isCheckOutState is DataFailed) {
      emit(CheckOutErrorState(errorMessage: isCheckOutState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetUserAttendanceInformationEvent(
      GetUserAttendanceInformationEvent event, Emitter<HomeState> emit) async {
    final stuffAttendanceInformationState =
        await _getStuffAttendanceInformationUseCase();
    if (stuffAttendanceInformationState
        is DataSuccess<UserAttendanceInformation>) {
      emit(SuccessGetStuffAttendanceInformationState(
          stuffAttendanceInformation: stuffAttendanceInformationState.data ??
              const UserAttendanceInformation()));
    } else if (stuffAttendanceInformationState is DataFailed) {
      emit(FailedGetStuffAttendanceInformationState(
          errorMessage: stuffAttendanceInformationState.message ?? ""));
    }
  }

  FutureOr<void> _onClearSearchVisitorEvent(
      ClearSearchVisitorEvent event, Emitter<HomeState> emit) {
    emit(ClearSearchVisitorState(visitors: _visitors));
  }

  FutureOr<void> _onClearSearchJobEvent(
      ClearSearchJobEvent event, Emitter<HomeState> emit) {
    emit(ClearSearchJobState(jobs: _jobs));
  }

  FutureOr<void> _onValidationPinCodeEvent(
      ValidationPinCodeEvent event, Emitter<HomeState> emit) {
    if (event.pinCode.length == 6) {
      emit(ValidPinCodeState(pinCode: event.pinCode));
    } else {
      emit(InvalidPinCodeState());
    }
  }

  FutureOr<void> _onValidationVisitorPinCodeEvent(
      ValidationVisitorPinCodeEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final validationVisitorPinCodeState =
        await _getValidateVisitorQrCodeUseCase(
            event.validateVisitorQrCodeRequest);

    if (validationVisitorPinCodeState is DataSuccess<ValidateVisitorQrCodeIn>) {
      final validateVisitorQrCodeIn = validationVisitorPinCodeState.data ??
          const ValidateVisitorQrCodeIn(
            sorceKey: 0,
            isValid: false,
          );
      emit(ValidVisitorPinCodeState(
        qrId: validateVisitorQrCodeIn.unitsQRCodeScanned.id.toString(),
        validateVisitorQrCodeIn: validateVisitorQrCodeIn,
      ));
    } else if (validationVisitorPinCodeState is DataFailed) {
      emit(InvalidVisitorPinCodeState(
          errorMessage: validationVisitorPinCodeState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onRemoveValuesFromPinCodeTextFieldEvent(
      RemoveValuesFromPinCodeTextFieldEvent event, Emitter<HomeState> emit) {
    emit(RemoveValuesFromPinCodeTextFieldState());
  }

  FutureOr<void> _onChangeJobItemSupportEvent(
      ChangeJobItemSupportEvent event, Emitter<HomeState> emit) async {
    final List<Support> jobs = List.from(event.jobs);
    for (int i = 0; i < jobs.length; i++) {
      if (jobs[i].requestId == event.job.requestId) {
        jobs[i] = jobs[i].copyWith(
          supportTechStatus: jobs[i].supportTechStatus.copyWith(
                statusId: event.job.supportTechStatus.statusId,
                statusName: event.job.supportTechStatus.statusName,
                code: event.job.supportTechStatus.code,
              ),
        );
        break;
      }
    }
    emit(ChangeJobItemSupportState(jobs: List.from(jobs)));
  }

  FutureOr<void> _onNavigateToQrDetailsScreenEvent(
      NavigateToQrDetailsScreenEvent event, Emitter<HomeState> emit) {
    emit(NavigateToQrDetailsScreenState(
      qrCodeDetailsIdOrPinCode: event.qrCodeDetailsIdOrPinCode,
      isComeFromQrCodeScanner: event.isComeFromQrScanner,
      qrCodeDetails: QrCodeDetails(
        isValid: event.validateVisitorQrCodeIn.isValid,
        unitsQRCodeScanned: event.validateVisitorQrCodeIn.unitsQRCodeScanned,
      ),
    ));
  }

  FutureOr<void> _onGetNotificationCountEvent(
      GetNotificationCountEvent event, Emitter<HomeState> emit) async {
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
}
