part of 'event_question_bloc.dart';

@immutable
abstract class EventQuestionEvent {}

class SubmitEventEvent extends EventQuestionEvent {
  final SubmitEventRequest submitEventRequest;
  final Map<String, File>? files;
  final Events event;

  SubmitEventEvent({
    required this.submitEventRequest,
    required this.files,
    required this.event,
  });
}

class SubmitValidationEvent extends EventQuestionEvent {
  final List<TextEditingController> textControllers;
  final List<String> imagePaths;
  final List<bool> hasChoiceOrNot;
  final List<ExtraFieldEvents> extraField;

  SubmitValidationEvent(
      {required this.textControllers,
      required this.extraField,
      required this.imagePaths,
      required this.hasChoiceOrNot});
}

class SubmitEventValidate extends EventQuestionEvent {
  ExtraFieldEvents extraFieldEvents;
  String? image;
  File? file;

  SubmitEventValidate({
    required this.extraFieldEvents,
    required this.image,
    required this.file,
  });
}

class SubmitEventRefresh extends EventQuestionEvent {}
