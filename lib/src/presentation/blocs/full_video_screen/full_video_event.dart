part of 'full_video_bloc.dart';

sealed class FullVideoEvent {}

final class InitializeVideoControllerEvent extends FullVideoEvent {
  final String videoUrl;

  InitializeVideoControllerEvent({
    required this.videoUrl,
  });
}

final class InitializeVideoPlayerEvent extends FullVideoEvent {}
