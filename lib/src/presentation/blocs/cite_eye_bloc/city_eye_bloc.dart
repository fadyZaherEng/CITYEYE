import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/request/get_offer_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/usecase/home/get_compound_home_section_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_offer_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/submit_event_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/submit_survey_use_case.dart';
import 'package:flutter/material.dart';

part 'city_eye_event.dart';
part 'city_eye_state.dart';

class CityEyeBloc extends Bloc<CityEyeEvent, CityEyeState> {
  final GetOfferUseCase _offersUseCase;
  final GetCompoundHomeSectionUseCase _getCompoundHomeSectionUseCase;
  final SubmitSurveyUseCase _submitSurveyUseCase;
  final SubmitEventUseCase _submitEventUseCase;

  CityEyeBloc(
    this._offersUseCase,
    this._getCompoundHomeSectionUseCase,
    this._submitSurveyUseCase,
    this._submitEventUseCase,
  ) : super(CityEyeInitial()) {
    on<HomeGetOfferEvent>(_onHomeGetOfferEvent);
    on<HomeGetCompoundHomeSectionEvent>(_onHomeGetCompoundHomeSectionEvent);
    on<SubmitSurveyEvent>(_onSubmitSurvey);
    on<HomeGetUpdateSurveyEvent>(_onHomeGetUpdateSurveyEvent);
    on<SubmitEventEvent>(_onSubmitEvent);
    on<SubmitEventPop>(_onSubmitEventPop);
  }

  FutureOr<void> _onHomeGetOfferEvent(
      HomeGetOfferEvent event, Emitter<CityEyeState> emit) async {
    emit(HomeGetOfferStateLoading());
    GetOfferRequest request = GetOfferRequest(pageCode: event.homeCompound);
    final offers = await _offersUseCase(request: request);
    if (offers is DataSuccess) {
      emit(HomeGetOfferStateSuccess(offers: offers.data ?? []));
    }
    if (offers is DataFailed) {
      emit(HomeGetOfferStateError(message: offers.message ?? ""));
    }
  }

  FutureOr<void> _onHomeGetCompoundHomeSectionEvent(
      HomeGetCompoundHomeSectionEvent event, Emitter<CityEyeState> emit) async {
    emit(HomeGetCompoundHomeSectionStateLoading());
    final getCompoundHomeSection = await _getCompoundHomeSectionUseCase();
    if (getCompoundHomeSection is DataSuccess) {
      emit(HomeGetCompoundHomeSectionStateSuccess(
          getCompoundHomeSection:
              getCompoundHomeSection.data ?? GetCompoundHomeSection()));
    }
    if (getCompoundHomeSection is DataFailed) {
      emit(HomeGetCompoundHomeSectionStateError(
          message: getCompoundHomeSection.message ?? ''));
    }
  }

  FutureOr<void> _onSubmitSurvey(
      SubmitSurveyEvent event, Emitter<CityEyeState> emit) async {
    emit(SubmitSurveyLoadingState());
    final surveyListState = await _submitSurveyUseCase(
      submitSurveyRequest: event.submitSurveyRequest,
      files: null,
    );
    if (surveyListState is DataSuccess) {
      emit(SubmitSurveySuccessState(
        survey: surveyListState.data ?? const Surveys(),
        surveyIndex: event.surveyIndex,
      ));
    }
    if (surveyListState is DataFailed) {
      emit(SubmitSurveyErrorState(message: surveyListState.message ?? ""));
    }
  }

  FutureOr<void> _onHomeGetUpdateSurveyEvent(
      HomeGetUpdateSurveyEvent event, Emitter<CityEyeState> emit) {
    emit(HomeGetUpdateSurveyState(surveys: event.surveys));
  }

  FutureOr<void> _onSubmitEvent(
      SubmitEventEvent event, Emitter<CityEyeState> emit) async {
    emit(SubmitEventLoadingState());
    final submitEventState = await _submitEventUseCase(
      submitEventRequest: event.submitEventRequest,
      files: null,
    );
    if (submitEventState is DataSuccess) {
      emit(
        SubmitEventSuccessState(
          submitEvent: submitEventState.data ?? const SubmitEvent(),
        ),
      );
    }
    if (submitEventState is DataFailed) {
      emit(SubmitEventErrorState(message: submitEventState.message ?? ""));
    }
  }

  FutureOr<void> _onSubmitEventPop(
      SubmitEventPop event, Emitter<CityEyeState> emit) {
    emit(SubmitEventPopState(
      context: event.context,
    ));
  }
}
