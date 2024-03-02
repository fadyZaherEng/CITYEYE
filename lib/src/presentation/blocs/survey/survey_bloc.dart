import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/usecase/home/get_survey_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/submit_survey_use_case.dart';
import 'package:meta/meta.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final GetSurveyListUseCase _getSurveyListUseCase;
  final SubmitSurveyUseCase _submitSurveyUseCase;

  SurveyBloc(
    this._getSurveyListUseCase,
    this._submitSurveyUseCase,
  ) : super(SurveyInitial()) {
    on<GetSurveyListEvent>(_onGetSurveyList);
    on<SubmitSurveyEvent>(_onSubmitSurvey);
  }

  FutureOr<void> _onGetSurveyList(
      GetSurveyListEvent event, Emitter<SurveyState> emit) async {
    emit(GetSurveyListLoadingState());
    final surveyListState = await _getSurveyListUseCase();
    if (surveyListState is DataSuccess) {
      emit(GetSurveyListSuccessState(surveys: surveyListState.data ?? []));
    }
    if (surveyListState is DataFailed) {
      emit(GetSurveyListErrorState(message: surveyListState.message ?? ""));
    }
  }

  FutureOr<void> _onSubmitSurvey(
      SubmitSurveyEvent event, Emitter<SurveyState> emit) async {
    emit(SubmitSurveyLoadingState());
    final surveyListState = await _submitSurveyUseCase(
        submitSurveyRequest: event.submitSurveyRequest, files: null);
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
}
