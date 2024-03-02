import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_city_eye_event.dart';
part 'main_city_eye_state.dart';

class MainCityEyeBloc extends Bloc<MainCityEyeEvent, MainCityEyeState> {
  MainCityEyeBloc() : super(MainCityEyeInitial()) {
    on<MainCityEyeChangeNavigationEvent>(_onMainCityEyeChangeNavigation);
  }

  FutureOr<void> _onMainCityEyeChangeNavigation(
      MainCityEyeChangeNavigationEvent event, Emitter<MainCityEyeState> emit) {
    emit(MainCityEyeChangeNavigationState(event.index));
  }
}
