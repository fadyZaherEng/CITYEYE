part of 'qr_scanner_bloc.dart';

abstract class QrScannerEvent extends Equatable {
  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class CheckValidationQrCodeEvent extends QrScannerEvent {
  final int pinCode;
  final String encryptedQr;

  CheckValidationQrCodeEvent({
    this.pinCode = 0,
    this.encryptedQr = "",
  });
}

final class NavigatorToQRCodeDetailsScreenEvent extends QrScannerEvent {
  ValidateVisitorQrCodeIn validateVisitorQrCodeIn;

  NavigatorToQRCodeDetailsScreenEvent(this.validateVisitorQrCodeIn);
}

final class NavigatorToServiceDetailsScreenEvent extends QrScannerEvent {
  ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToServiceDetailsScreenEvent(this.validateVisitorQrCodeIn);
}

final class NavigatorToBadgeDetailsScreenEvent extends QrScannerEvent {
  ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToBadgeDetailsScreenEvent(this.validateVisitorQrCodeIn);
}

final class NavigatorToDelegationDetailsScreenEvent extends QrScannerEvent {
  ValidateVisitorQrCodeIn validateVisitorQrCodeIn;
  NavigatorToDelegationDetailsScreenEvent(this.validateVisitorQrCodeIn);
}
