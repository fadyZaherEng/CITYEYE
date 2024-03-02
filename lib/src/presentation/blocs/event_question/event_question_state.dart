part of 'event_question_bloc.dart';

@immutable
abstract class EventQuestionState {}

class EventQuestionInitial extends EventQuestionState {}

class SubmitEventLoadingState extends EventQuestionState {}

class SubmitEventSuccessState extends EventQuestionState {
  final SubmitEvent submitEvent;
  final String message;
  final Events event;
  SubmitEventSuccessState({
    required this.submitEvent,
    required this.message,
    required this.event,
  });
}

class SubmitEventErrorState extends EventQuestionState {
  final String message;
  SubmitEventErrorState({
    required this.message,
  });
}

class SubmitValidationTextState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationTextState({
    required this.validOrNot,
  });
}

class SubmitValidationNumberState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationNumberState({
    required this.validOrNot,
  });
}

class SubmitValidationDateState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationDateState({
    required this.validOrNot,
  });
}

class SubmitValidationSingleChoiceState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationSingleChoiceState({
    required this.validOrNot,
  });
}

class SubmitValidationMultipleChoiceState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationMultipleChoiceState({
    required this.validOrNot,
  });
}

class SubmitValidationImageState extends EventQuestionState {
  final bool validOrNot;
  SubmitValidationImageState({
    required this.validOrNot,
  });
}

class SubmitEventValidateState extends EventQuestionState {
  ExtraFieldEvents extraFieldEvents;
  String? imageName;
  File? file;
  SubmitEventValidateState({
    required this.extraFieldEvents,
    required this.imageName,
    required this.file,
  });
}

class SubmitEventRefreshState extends EventQuestionState {}
