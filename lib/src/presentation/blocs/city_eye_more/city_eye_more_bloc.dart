import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/usecase/home/get_compound_configuration_use_case.dart';
import 'package:meta/meta.dart';

part 'city_eye_more_event.dart';
part 'city_eye_more_state.dart';

class CityEyeMoreBloc extends Bloc<CityEyeMoreEvent, CityEyeMoreState> {
  final GetCompoundConfigurationUseCase _getCompoundConfigurationUseCase;

  CityEyeMoreBloc(
    this._getCompoundConfigurationUseCase,
  ) : super(CityEyeMoreInitial()) {
    on<CityEyeMoreGetCompoundConfigurationEvent>(_onGetCompoundConfiguration);
  }

  FutureOr<void> _onGetCompoundConfiguration(
      CityEyeMoreGetCompoundConfigurationEvent event,
      Emitter<CityEyeMoreState> emit) async {
    emit(CityEyeMoreLoading());
    final resultSate = await _getCompoundConfigurationUseCase();
    if (resultSate is DataSuccess<GetCompoundConfiguration>) {
      emit(CityEyeMoreGetCompoundConfigurationSuccess(
        getCompoundConfiguration:
            resultSate.data ?? const GetCompoundConfiguration(),
      ));
    }
    if (resultSate is DataFailed) {
      emit(CityEyeMoreGetCompoundConfigurationFailed(
        message: resultSate.message ?? '',
      ));
    }
  }
}
