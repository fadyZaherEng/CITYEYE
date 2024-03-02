import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';

part 'full_video_event.dart';

part 'full_video_state.dart';

class FullVideoBloc extends Bloc<FullVideoEvent, FullVideoState> {
  FullVideoBloc() : super(FullVideoInitial()) {
    on<InitializeVideoControllerEvent>(_onInitializeVideoEvent);
    on<InitializeVideoPlayerEvent>(_onInitializeVideoPlayerEvent);
  }

  FutureOr<void> _onInitializeVideoEvent(
      InitializeVideoControllerEvent event, Emitter<FullVideoState> emit) {
    emit(SuccessInitializeVideoState(videoUrl: event.videoUrl));
  }

  FutureOr<void> _onInitializeVideoPlayerEvent(
      InitializeVideoPlayerEvent event, Emitter<FullVideoState> emit) {
    emit(SuccessInitializeVideoPlayerState());
  }
}
