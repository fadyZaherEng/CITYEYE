import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/qr_code_details_request.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/usecase/home/get_qr_code_details_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_validate_visitor_qr_code_use_case.dart';
import 'package:equatable/equatable.dart';

part 'qr_details_event.dart';
part 'qr_details_state.dart';

class QrDetailsBloc extends Bloc<QrDetailsEvent, QrDetailsState> {
  final GetQrCodeDetailsUseCase _getQrCodeDetailsUseCase;
  final GetValidateVisitorQrCodeUseCase _getValidateVisitorQrCodeUseCase;

  QrDetailsBloc(
      this._getQrCodeDetailsUseCase, this._getValidateVisitorQrCodeUseCase)
      : super(HistoryDetailsInitial()) {
    on<FetchQrDetailsEvent>(_onFetchQrDetailsEvent);
    on<NavigateToBackEvent>(_onNavigateToBackEvent);
    on<ShowMessageDialogErrorEvent>(_onShowMessageDialogErrorEvent);
    on<FetchQrDetailsForPinCodeEvent>(_onFetchQrDetailsForPinCodeEvent);
  }

  Future<void> _onFetchQrDetailsEvent(
      FetchQrDetailsEvent event, Emitter<QrDetailsState> emit) async {
    emit(ShowingSkeletonQrDetailsState());
    final qrCodeDetailsState = await _getQrCodeDetailsUseCase(
        QrCodeDetailsRequest(qrId: event.qrCodeDetailsId, pinCode: 0));
    if (qrCodeDetailsState is DataSuccess<QrCodeDetails>) {
      emit(SuccessFetchQrDetailsState(
          qrCodeDetails: qrCodeDetailsState.data ?? const QrCodeDetails()));
    } else if (qrCodeDetailsState is DataFailed) {
      emit(FailedFetchQrDetailsState(
          errorMessage: qrCodeDetailsState.message ?? ""));
    }
  }

  FutureOr<void> _onNavigateToBackEvent(
      NavigateToBackEvent event, Emitter<QrDetailsState> emit) {
    emit(NavigateToBackState());
  }

  FutureOr<void> _onShowMessageDialogErrorEvent(
      ShowMessageDialogErrorEvent event, Emitter<QrDetailsState> emit) {
    emit(ShowMessageDialogErrorState(errorMessage: event.errorMessage));
  }

  FutureOr<void> _onFetchQrDetailsForPinCodeEvent(
      FetchQrDetailsForPinCodeEvent event, Emitter<QrDetailsState> emit) async {
    emit(ShowingSkeletonQrDetailsState());
    // final qrCodeDetailsState = await _getValidateVisitorQrCodeUseCase(
    //     ValidateVisitorQrCodeRequest(qrId: event.pinCode, pinCode: 0));
    // if (qrCodeDetailsState is DataSuccess<QrCodeDetails>) {
    //   emit(SuccessFetchQrDetailsForPinCodeState(
    //       qrCodeDetails: qrCodeDetailsState.data ?? const QrCodeDetails()));
    // } else if (qrCodeDetailsState is DataFailed) {
    //   emit(FailedFetchQrDetailsForPinCodeState(
    //       errorMessage: qrCodeDetailsState.message ?? ""));
    // }
  }
}
