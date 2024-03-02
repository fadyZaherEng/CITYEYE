part of 'city_eye_bloc.dart';

@immutable
abstract class CityEyeEvent {}

class HomeGetOfferEvent extends CityEyeEvent {
  final String homeCompound;
  HomeGetOfferEvent({required this.homeCompound});
}

class HomeGetCompoundHomeSectionEvent extends CityEyeEvent {}

class SubmitSurveyEvent extends CityEyeEvent {
  final SubmitSurveyRequest submitSurveyRequest;
  final int surveyIndex;
  SubmitSurveyEvent({
    required this.submitSurveyRequest,
    required this.surveyIndex,
  });
}

class HomeGetUpdateSurveyEvent extends CityEyeEvent {
  final List<Surveys> surveys;
  HomeGetUpdateSurveyEvent({required this.surveys});
}

class SubmitEventEvent extends CityEyeEvent {
  final SubmitEventRequest submitEventRequest;
  SubmitEventEvent({
    required this.submitEventRequest,
  });
}

class SubmitEventPop extends CityEyeEvent {
  final BuildContext context;
  SubmitEventPop({required this.context});
}
