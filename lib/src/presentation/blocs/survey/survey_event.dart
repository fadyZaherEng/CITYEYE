part of 'survey_bloc.dart';

@immutable
abstract class SurveyEvent {}

class GetSurveyListEvent extends SurveyEvent {}

class SubmitSurveyEvent extends SurveyEvent {
  final SubmitSurveyRequest submitSurveyRequest;
  final int surveyIndex;
  SubmitSurveyEvent({
    required this.submitSurveyRequest,
    required this.surveyIndex,
  });
}
