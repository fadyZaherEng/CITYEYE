part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

class HomeInitial extends HomeState {}

class ShowSkeletonState extends HomeState {}

class ShowLoadingState extends HomeState {}

class HideLoadingState extends HomeState {}

class CheckInSuccessState extends HomeState {
  final UserAttendanceInformation stuffAttendanceChecking;
  final String successMessage;

  CheckInSuccessState({
    required this.stuffAttendanceChecking,
    required this.successMessage,
  });
}

class CheckInErrorState extends HomeState {
  final String errorMessage;

  CheckInErrorState({
    required this.errorMessage,
  });
}

class CheckOutSuccessState extends HomeState {
  final UserAttendanceInformation stuffAttendanceChecking;
  final String successMessage;

  CheckOutSuccessState({
    required this.stuffAttendanceChecking,
    required this.successMessage,
  });
}

class CheckOutErrorState extends HomeState {
  final String errorMessage;

  CheckOutErrorState({
    required this.errorMessage,
  });
}

// Get All Visitors States
class SuccessFetchAllVisitorsState extends HomeState {
  final List<Visitor> visitors;

  SuccessFetchAllVisitorsState({
    required this.visitors,
  });
}

class FailureFetchAllVisitorsState extends HomeState {
  final String errorMessage;

  FailureFetchAllVisitorsState({
    required this.errorMessage,
  });
}

// Get All Jobs States
class SuccessFetchAllJobsState extends HomeState {
  final List<Support> jobs;

  SuccessFetchAllJobsState({
    required this.jobs,
  });
}

class FailureFetchAllJobsState extends HomeState {
  final String message;

  FailureFetchAllJobsState({
    required this.message,
  });
}

class ShowBottomSheetWidgetForSecurityState extends HomeState {}

class ShowBottomSheetWidgetForTechnicalState extends HomeState {}

class NavigateToQrDetailsScreenState extends HomeState {
  final int qrCodeDetailsIdOrPinCode;
  final bool isComeFromQrCodeScanner;
  final QrCodeDetails? qrCodeDetails;

  NavigateToQrDetailsScreenState({
    required this.qrCodeDetailsIdOrPinCode,
    required this.isComeFromQrCodeScanner,
    required this.qrCodeDetails,
  });
}

class NavigateToJobDetailsScreenState extends HomeState {
  final int id;

  NavigateToJobDetailsScreenState({
    required this.id,
  });
}

class SearchVisitorState extends HomeState {
  final List<Visitor> visitors;

  SearchVisitorState(this.visitors);
}

class SearchJobState extends HomeState {
  final List<Support> jobs;

  SearchJobState(this.jobs);
}

// Get Stuff Attendance Information States
final class SuccessGetStuffAttendanceInformationState extends HomeState {
  final UserAttendanceInformation stuffAttendanceInformation;

  SuccessGetStuffAttendanceInformationState({
    required this.stuffAttendanceInformation,
  });
}

final class FailedGetStuffAttendanceInformationState extends HomeState {
  final String errorMessage;

  FailedGetStuffAttendanceInformationState({
    required this.errorMessage,
  });
}

class ClearSearchVisitorState extends HomeState {
  final List<Visitor> visitors;

  ClearSearchVisitorState({required this.visitors});
}

class ClearSearchJobState extends HomeState {
  final List<Support> jobs;

  ClearSearchJobState({required this.jobs});
}

final class ValidPinCodeState extends HomeState {
  final String pinCode;

  ValidPinCodeState({required this.pinCode});
}

final class InvalidPinCodeState extends HomeState {}

final class ValidVisitorPinCodeState extends HomeState {
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  final String qrId;

  ValidVisitorPinCodeState({
    required this.validateVisitorQrCodeIn,
    required this.qrId,
  });
}

final class InvalidVisitorPinCodeState extends HomeState {
  final String errorMessage;

  InvalidVisitorPinCodeState({required this.errorMessage});
}

final class RemoveValuesFromPinCodeTextFieldState extends HomeState {}

final class ChangeJobItemSupportState extends HomeState {
  final List<Support> jobs;

  ChangeJobItemSupportState({required this.jobs});
}

final class QrCodeDetailsState extends HomeState {
  final QrCodeDetails qrCodeDetails;

  QrCodeDetailsState({required this.qrCodeDetails});
}

final class QrCodeFailedState extends HomeState {
  final String errorMessage;

  QrCodeFailedState({required this.errorMessage});
}

class GetNotificationCountSuccessState extends HomeState {
  final int count;

  GetNotificationCountSuccessState({required this.count});
}

class GetNotificationCountFailedState extends HomeState {
  final String errorMessage;

  GetNotificationCountFailedState({required this.errorMessage});
}
