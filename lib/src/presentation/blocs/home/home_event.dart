part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [identityHashCode(this)];
}

class CheckInEvent extends HomeEvent {}

class CheckOutEvent extends HomeEvent {}

class GetVisitorsEvent extends HomeEvent {
  final bool isShowLoading;
  final String searchValue;

  const GetVisitorsEvent({
    this.isShowLoading = false,
    this.searchValue = "",
  });
}

class GetJobsEvent extends HomeEvent {
  final bool isShowLoading;
  final String searchValue;

  const GetJobsEvent({
    this.isShowLoading = false,
    this.searchValue = "",
  });
}

// final class GetCurrentUserEvent extends HomeEvent {}

class ShowPinCodeBottomSheetForSecurityEvent extends HomeEvent {}

class ShowPinCodeBottomSheetForTechnicalEvent extends HomeEvent {}

class NavigateToQrDetailsScreenEvent extends HomeEvent {
  final int qrCodeDetailsIdOrPinCode;
  final bool isComeFromQrScanner;
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;

  const NavigateToQrDetailsScreenEvent({
    required this.qrCodeDetailsIdOrPinCode,
    required this.isComeFromQrScanner,
    required this.validateVisitorQrCodeIn,
  });
}

class NavigateToJobDetailsScreenEvent extends HomeEvent {
  final int id;

  const NavigateToJobDetailsScreenEvent({
    required this.id,
  });
}

class SearchVisitorEvent extends HomeEvent {
  final String value;

  const SearchVisitorEvent({
    required this.value,
  });
}

class SearchJobEvent extends HomeEvent {
  final String searchedValue;

  const SearchJobEvent(this.searchedValue);
}

class ClearSearchVisitorEvent extends HomeEvent {}

class ClearSearchJobEvent extends HomeEvent {}

final class GetUserAttendanceInformationEvent extends HomeEvent {}

final class ValidationPinCodeEvent extends HomeEvent {
  final String pinCode;

  const ValidationPinCodeEvent({this.pinCode = ""});
}

final class ValidationVisitorPinCodeEvent extends HomeEvent {
  final ValidateVisitorQrCodeRequest validateVisitorQrCodeRequest;

  const ValidationVisitorPinCodeEvent({
    required this.validateVisitorQrCodeRequest,
  });
}

final class RemoveValuesFromPinCodeTextFieldEvent extends HomeEvent {}

final class ChangeJobItemSupportEvent extends HomeEvent {
  final List<Support> jobs;
  final Support job;

  const ChangeJobItemSupportEvent({
    required this.jobs,
    required this.job,
  });
}

final class GetQrCodeDetailsEvent extends HomeEvent {
  final int qrCodeDetailsId;

  const GetQrCodeDetailsEvent({required this.qrCodeDetailsId});
}

class GetNotificationCountEvent extends HomeEvent {}
