part of 'survey_bloc.dart';

@immutable
abstract class SurveyState {}

class SurveyInitial extends SurveyState {}

class GetSurveyListLoadingState extends SurveyState {}

class GetSurveyListSuccessState extends SurveyState {
  final List<Surveys> surveys;
  GetSurveyListSuccessState({
    required this.surveys,
  });
}

class GetSurveyListErrorState extends SurveyState {
  final String message;
  GetSurveyListErrorState({
    required this.message,
  });
}

class SubmitSurveyLoadingState extends SurveyState {}

class SubmitSurveySuccessState extends SurveyState {
  final Surveys survey;
  final int surveyIndex;
  SubmitSurveySuccessState({
    required this.survey,
    required this.surveyIndex,
  });
}

class SubmitSurveyErrorState extends SurveyState {
  final String message;
  SubmitSurveyErrorState({
    required this.message,
  });
}
