part of 'qr_details_bloc.dart';

abstract class QrDetailsState extends Equatable {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class HistoryDetailsInitial extends QrDetailsState {}

class ShowingSkeletonQrDetailsState extends QrDetailsState {}

class SuccessFetchQrDetailsState extends QrDetailsState {
  final QrCodeDetails qrCodeDetails;

  SuccessFetchQrDetailsState({
    required this.qrCodeDetails,
  });
}

class FailedFetchQrDetailsState extends QrDetailsState {
  final String errorMessage;

  FailedFetchQrDetailsState({
    required this.errorMessage,
  });
}

class SuccessFetchQrDetailsForPinCodeState extends QrDetailsState {
  final QrCodeDetails qrCodeDetails;

  SuccessFetchQrDetailsForPinCodeState({
    required this.qrCodeDetails,
  });
}

class FailedFetchQrDetailsForPinCodeState extends QrDetailsState {
  final String errorMessage;

  FailedFetchQrDetailsForPinCodeState({
    required this.errorMessage,
  });
}

class NavigateToBackState extends QrDetailsState {}

class ShowMessageDialogErrorState extends QrDetailsState {
  final String errorMessage;

  ShowMessageDialogErrorState({
    required this.errorMessage,
  });
}
