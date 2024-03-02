part of 'qr_details_bloc.dart';

abstract class QrDetailsEvent extends Equatable {
  const QrDetailsEvent();

  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class FetchQrDetailsEvent extends QrDetailsEvent {
  final int qrCodeDetailsId;

  const FetchQrDetailsEvent({
    required this.qrCodeDetailsId,
  });
}

final class NavigateToBackEvent extends QrDetailsEvent {}

final class ShowMessageDialogErrorEvent extends QrDetailsEvent {
  final String errorMessage;

  const ShowMessageDialogErrorEvent({
    required this.errorMessage,
  });
}
final class FetchQrDetailsForPinCodeEvent extends QrDetailsEvent {
  final int pinCode;

  const FetchQrDetailsForPinCodeEvent({
    required this.pinCode,
  });
}

