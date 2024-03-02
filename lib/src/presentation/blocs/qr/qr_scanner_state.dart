part of 'qr_scanner_bloc.dart';

abstract class QrScannerState extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class QrScannerInitial extends QrScannerState {}

final class ShowLoadingState extends QrScannerState {}

final class HideLoadingState extends QrScannerState {}

final class SuccessCheckingValidationQrCodeState extends QrScannerState {
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;

  SuccessCheckingValidationQrCodeState({
    required this.validateVisitorQrCodeIn,
  });
}

final class FailureCheckingValidationQrCodeState extends QrScannerState {
  final String errorMessage;

  FailureCheckingValidationQrCodeState({
    required this.errorMessage,
  });
}

final class NavigatorToQRCodeDetailsScreenState extends QrScannerState {
  final QrCodeDetails validateVisitorQrCodeIn;
  NavigatorToQRCodeDetailsScreenState({
    required this.validateVisitorQrCodeIn,
  });
}

final class NavigatorToServiceDetailsScreenState extends QrScannerState {
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToServiceDetailsScreenState({
    required this.validateVisitorQrCodeIn,
  });
}

final class NavigatorToBadgeDetailsScreenState extends QrScannerState {
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToBadgeDetailsScreenState({
    required this.validateVisitorQrCodeIn,
  });
}

final class NavigatorToDelegationDetailsScreenState extends QrScannerState {
  final ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToDelegationDetailsScreenState({
    required this.validateVisitorQrCodeIn,
  });
}
