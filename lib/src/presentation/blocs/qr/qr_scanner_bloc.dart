import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_validate_visitor_qr_code_use_case.dart';
import 'package:equatable/equatable.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  final GetValidateVisitorQrCodeUseCase _getValidateVisitorQrCodeUseCase;
  final GetLanguageUseCase _getLanguageUseCase;

  QrScannerBloc(
    this._getValidateVisitorQrCodeUseCase,
    this._getLanguageUseCase,
  ) : super(QrScannerInitial()) {
    on<CheckValidationQrCodeEvent>(_onCheckValidationQrCodeEvent);
    on<NavigatorToQRCodeDetailsScreenEvent>(
        _onNavigatorToQRCodeDetailsScreenEvent);
    on<NavigatorToBadgeDetailsScreenEvent>(
        _onNavigatorToBadgeDetailsScreenEvent);
    on<NavigatorToDelegationDetailsScreenEvent>(
        _onNavigatorToDelegationDetailsScreenEvent);
    on<NavigatorToServiceDetailsScreenEvent>(
        _onNavigatorToServiceDetailsScreenEvent);
  }

  FutureOr<void> _onCheckValidationQrCodeEvent(
      CheckValidationQrCodeEvent event, Emitter<QrScannerState> emit) async {
    emit(ShowLoadingState());
    try {
      final validateVisitorQrCodeInState =
          await _getValidateVisitorQrCodeUseCase(
        ValidateVisitorQrCodeRequest(
          pinCode: event.pinCode,
          encryptedQr: event.encryptedQr,
        ),
      );
      if (validateVisitorQrCodeInState
          is DataSuccess<ValidateVisitorQrCodeIn>) {
        emit(
          SuccessCheckingValidationQrCodeState(
            validateVisitorQrCodeIn: validateVisitorQrCodeInState.data ??
                const ValidateVisitorQrCodeIn(sorceKey: 0, isValid: false),
          ),
        );
      } else if (validateVisitorQrCodeInState is DataFailed) {
        emit(FailureCheckingValidationQrCodeState(
            errorMessage: validateVisitorQrCodeInState.message ?? ""));
      }
    } catch (_) {
      emit(FailureCheckingValidationQrCodeState(
        errorMessage: _getLanguageUseCase() == 'en'
            ? "Qr Code is not Valid"
            : "الكود غير صالح",
      ));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onNavigatorToQRCodeDetailsScreenEvent(
      NavigatorToQRCodeDetailsScreenEvent event, Emitter<QrScannerState> emit) {
    emit(NavigatorToQRCodeDetailsScreenState(
        validateVisitorQrCodeIn: QrCodeDetails(
      isValid: event.validateVisitorQrCodeIn.isValid,
      unitsQRCodeScanned: event.validateVisitorQrCodeIn.unitsQRCodeScanned,
    )));
  }

  FutureOr<void> _onNavigatorToBadgeDetailsScreenEvent(
      NavigatorToBadgeDetailsScreenEvent event, Emitter<QrScannerState> emit) {
    emit(NavigatorToBadgeDetailsScreenState(
        validateVisitorQrCodeIn: event.validateVisitorQrCodeIn));
  }

  FutureOr<void> _onNavigatorToDelegationDetailsScreenEvent(
      NavigatorToDelegationDetailsScreenEvent event,
      Emitter<QrScannerState> emit) {
    emit(NavigatorToDelegationDetailsScreenState(
        validateVisitorQrCodeIn: event.validateVisitorQrCodeIn));
  }

  FutureOr<void> _onNavigatorToServiceDetailsScreenEvent(
      NavigatorToServiceDetailsScreenEvent event,
      Emitter<QrScannerState> emit) {
    emit(NavigatorToServiceDetailsScreenState(
        validateVisitorQrCodeIn: event.validateVisitorQrCodeIn));
  }
}
