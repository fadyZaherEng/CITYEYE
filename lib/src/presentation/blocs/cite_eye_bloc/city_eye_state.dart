part of 'city_eye_bloc.dart';

@immutable
abstract class CityEyeState {}

class CityEyeInitial extends CityEyeState {}

class HomeGetOfferStateLoading extends CityEyeState {}

class HomeGetOfferStateSuccess extends CityEyeState {
  final List<GetOffers> offers;
  HomeGetOfferStateSuccess({required this.offers});
}

class HomeGetOfferStateError extends CityEyeState {
  final String message;
  HomeGetOfferStateError({required this.message});
}

class HomeGetCompoundHomeSectionStateLoading extends CityEyeState {}

class HomeGetCompoundHomeSectionStateSuccess extends CityEyeState {
  final GetCompoundHomeSection getCompoundHomeSection;
  HomeGetCompoundHomeSectionStateSuccess(
      {required this.getCompoundHomeSection});
}

class HomeGetCompoundHomeSectionStateError extends CityEyeState {
  final String message;
  HomeGetCompoundHomeSectionStateError({required this.message});
}

class SubmitSurveyLoadingState extends CityEyeState {}

class SubmitSurveySuccessState extends CityEyeState {
  final Surveys survey;
  final int surveyIndex;
  SubmitSurveySuccessState({
    required this.survey,
    required this.surveyIndex,
  });
}

class SubmitSurveyErrorState extends CityEyeState {
  final String message;
  SubmitSurveyErrorState({
    required this.message,
  });
}

class HomeGetUpdateSurveyState extends CityEyeState {
  final List<Surveys> surveys;
  HomeGetUpdateSurveyState({required this.surveys});
}

class SubmitEventLoadingState extends CityEyeState {}

class SubmitEventSuccessState extends CityEyeState {
  final SubmitEvent submitEvent;
  SubmitEventSuccessState({
    required this.submitEvent,
  });
}

class SubmitEventErrorState extends CityEyeState {
  final String message;
  SubmitEventErrorState({
    required this.message,
  });
}

class SubmitEventPopState extends CityEyeState {
  final BuildContext context;
  SubmitEventPopState({required this.context});
}
