import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:city_eye/src/domain/usecase/home/submit_event_use_case.dart';
import 'package:flutter/material.dart';

part 'event_question_event.dart';
part 'event_question_state.dart';

class EventQuestionBloc extends Bloc<EventQuestionEvent, EventQuestionState> {
  final SubmitEventUseCase _submitEventUseCase;

  EventQuestionBloc(
    this._submitEventUseCase,
  ) : super(EventQuestionInitial()) {
    on<SubmitEventEvent>(_onSubmitEvent);
    on<SubmitEventValidate>(_onSubmitEventValidate);
    on<SubmitEventRefresh>(_onSubmitEventRefresh);
  }

  FutureOr<void> _onSubmitEvent(
      SubmitEventEvent event, Emitter<EventQuestionState> emit) async {
    emit(SubmitEventLoadingState());
    final submitEventState = await _submitEventUseCase(
        submitEventRequest: event.submitEventRequest, files: event.files);
    if (submitEventState is DataSuccess) {
      emit(SubmitEventSuccessState(
        submitEvent: submitEventState.data ?? const SubmitEvent(),
        message: submitEventState.message ?? "",
        event: event.event,
      ));
    }
    if (submitEventState is DataFailed) {
      emit(SubmitEventErrorState(message: submitEventState.message ?? ""));
    }
  }

  FutureOr<void> _onSubmitEventValidate(
      SubmitEventValidate event, Emitter<EventQuestionState> emit) {
    emit(
      SubmitEventValidateState(
        extraFieldEvents: event.extraFieldEvents,
        imageName: event.image,
        file: event.file,
      ),
    );
  }

  FutureOr<void> _onSubmitEventRefresh(
      SubmitEventRefresh event, Emitter<EventQuestionState> emit) {
    emit(SubmitEventRefreshState());
  }
}
